from flask import Flask
from config import Config
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

app.config['SECRET_KEY'] = 'you-will-never-guess'

from app import routes, models
