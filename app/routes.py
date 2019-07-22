from datetime import date, datetime
import os
import re
from flask import render_template, flash, redirect, url_for, jsonify, request
from app import app
from app import db
from app.models import LoadReleaseInfo, LoadReleaseTableInfo
from app.forms import UploadForm
from CHECK.cpar.zip_extract import ExtractFiles
from CHECK.cpar.flat_to_raw import HFSLoadData
from CHECK.cpar.staging import Staging
from CHECK.cpar.cost_categorization import CostCategorizer
from CHECK.cpar.pat_info import RiskCategorizer, DiagnosisCategorizer
from sqlalchemy import desc

raw_data_dir = os.path.abspath('./CHECK_Population')
initial_file_name = '2016_05'

@app.route('/index', methods=['GET','POST'])
@app.route('/', methods=['GET','POST'])
def index():

    total_files = os.listdir(raw_data_dir)
    #gets all data then only selects those that have the correct naming conventions
    total_files = [i for i in total_files if re_name_check(i)]
    total_files.sort()

    releases = LoadReleaseInfo.query.order_by('FileName').all()

    if len(releases) == 0:
        release_num = 1
        curr_release = initial_file_name
    else:
        releases = [i.to_dict() for i in releases]
        prev_release = releases[-1]
        curr_release = next_release_name(prev_release['file_name'])
        release_num = prev_release['release_num'] + 1

    if curr_release not in total_files:
        load = False
    else:
        load = True

    release_date = curr_release.split('_')
    release_date = date(int(release_date[0]), int(release_date[1]), 1)
    form = UploadForm(release_num=release_num, release_date=release_date, file_name=curr_release)
    if form.validate_on_submit():
        release_num = form.release_num.data
        release_date = form.release_date.data
        file_name = form.file_name.data
        return redirect(url_for('load', release_num=release_num, file_name=file_name, release_date=release_date))
    return render_template('index.html', load=load, curr_release=curr_release, form=form)


@app.route('/load', methods=['GET', 'POST'])
def load():

    file_name = request.args.get('file_name')
    release_num = request.args.get('release_num')
    release_date = request.args.get('release_date')
    load_date = '{:%Y-%m-%d}'.format(date.today())

    path = os.path.join(raw_data_dir, file_name)

    extractor = ExtractFiles(path)
    print(extractor.file_initiator())

    flat_to_raw = HFSLoadData('CHECK_CPAR2', release_num, path)
    flat_to_raw.sql_query_generate()

    raw_output = flat_to_raw.load_table_inline()

    for table in raw_output:
        hfs_load_count_dict_import(table)

    print('staging')
    stager = Staging('CHECK_CPAR2', release_num)
    stage_output = stager.raw_to_stage_wrapper()

    for table in stage_output:
        hfs_load_count_dict_import(table)

    table_load_info = raw_output + stage_output
    #categorize stage claims
    print('categorize')
    categorizer = CostCategorizer('CHECK_CPAR2')
    categorizer.categorize_wrapper()

    #update dx for the release
    dxer = DiagnosisCategorizer('CHECK_CPAR2', release_date, release_num)
    dxer.dx_wrapper(insert=True)
    #update risk for the release
    print('risk')
    risker = RiskCategorizer('CHECK_CPAR2', release_date, release_num)
    risker.risk_wrapper(insert=True)

    load_count_info = LoadReleaseInfo(ReleaseNum=release_num,
                                      ReleaseDate=release_date,
                                      LoadDate=load_date,
                                      FileName=file_name,
                                      LoadStatus='Complete')

    db.session.add(load_count_info)
    db.session.commit()

    return render_template('load_complete.html', curr_release=file_name, table_load_info=table_load_info, title='Load Complete')

@app.route('/load_info', methods=['GET','POST'])
def load_info():

    release_info = LoadReleaseInfo.query.order_by(desc('ReleaseDate')).all()

    release_info = [i.to_dict() for i in release_info]

    return render_template('load_history.html', release_info=release_info)

def hfs_load_count_dict_import(load_dict):
    load_count_info = LoadReleaseTableInfo(TableName=load_dict['table'],
                                           ReleaseNum=load_dict['release_num'],
                                           LoadDate=load_dict['load_date'],
                                           NRows=load_dict['nrows'],
                                           Type=load_dict['type'])
    db.session.add(load_count_info)
    db.session.commit()



def re_name_check(file):
    '''File name most be in the following format or it isnt valid'''

    match = re.search(r'^\d\d\d\d_\d\d$', file)
    if match:
      return True
    else:
      return False


def next_release_name(release_file_name):
        year_month_str = release_file_name.split('_')
        if year_month_str[1] == '12':
            year = str(int(year_month_str[0])+1)
            month = '01'
        else:
            year = year_month_str[0]
            month = str(int(year_month_str[1])+1).zfill(2)
        return '{}_{}'.format(year, month)

def prev_release_name(release_file_name):
        year_month_str = release.split('_')
        if year_month_str[1] == '01':
            year = str(int(year_month_str[0])-1)
            month = '12'
        else:
            year = year_month_str[0]
            month = str(int(year_month_str[1])-1).zfill(2)
        return '{}_{}'.format(year, month)
