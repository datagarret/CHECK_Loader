from datetime import date
import os
import re
from flask import render_template, flash, redirect, url_for, jsonify, request
from app import app
from app import db
from app.models import HfsReleaseInfo, HfsLoadCountInfo
from app.forms import UploadForm
from CHECK.cpar.zip_extract import ExtractFiles
from CHECK.cpar.flat_to_raw import HFSLoadData
from CHECK.cpar.staging import Staging

raw_data_dir = os.path.abspath('./CHECK_Population')
initial_file_name = '2016_05'

@app.route('/', methods=['GET','POST'])
def index():

    total_files = os.listdir(raw_data_dir)
    total_files = [i for i in total_files if re_name_check(i)]
    total_files.sort()

    releases = HfsReleaseInfo.query.order_by('FileName').all()

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
        flash('Load is processomg!')
        return redirect(url_for('index'))
    return render_template('index.html', load=load, curr_release=curr_release, form=form)



@app.route('/load', methods=['GET', 'POST'])
def load():

    file_name = request.form.get('file_name')
    release_num = request.form.get('release_num')
    release_date = request.form.get('release_date')
    load_date = request.form.get('load_date')
    print(type(load_date))
    path = os.path.join(raw_data_dir, file_name)

    extractor = ExtractFiles(path)
    print(extractor.file_initiator())

    flat_to_raw = HFSLoadData('CHECK_CPAR2', release_num, path)
    flat_to_raw.sql_query_generate()

    output = flat_to_raw.load_table_inline()

    for table in output:
        hfs_load_count_dict_import(table)

    stager = Staging('CHECK_CPAR2', release_num)
    stage_output = stager.raw_to_stage_wrapper()

    for table in stage_output:
        hfs_load_count_dict_import(table)

    load_count_info = HfsReleaseInfo(ReleaseNum=release_num,
                                     ReleaseDate=release_date,
                                     LoadDate=load_date,
                                     FileName=file_name,
                                     LoadStatus='Complete')

    db.session.add(load_count_info)
    db.session.commit()

    return 'Data load for {} was completed!'.format(file_name)



def hfs_load_count_dict_import(load_dict):
    load_count_info = HfsLoadCountInfo(TableName=load_dict['table'],
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
