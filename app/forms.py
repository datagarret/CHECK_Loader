from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, DateField, IntegerField
from wtforms.validators import DataRequired

class UploadForm(FlaskForm):
    file_name = StringField('File Name')
    release_num = IntegerField('Release Number', validators=[DataRequired()])
    release_date = DateField('Release Date', validators=[DataRequired()])
    submit = SubmitField('Start Load')
