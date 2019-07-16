from app import db

class LoadReleaseInfo(db.Model):
    ReleaseNum = db.Column(db.Integer, primary_key=True)
    ReleaseDate = db.Column(db.DateTime)
    LoadDate = db.Column(db.DateTime)
    FileName = db.Column(db.String(128))
    LoadStatus = db.Column(db.String(128))

    def __repr__(self):
        return '<Release {}>'.format(self.ReleaseNum)

    def to_dict(self):
        data = {
        'release_num': self.ReleaseNum,
        'release_date': self.ReleaseDate,
        'load_date': self.LoadDate,
        'file_name': self.FileName,
        'load_status': self.LoadStatus,
        }
        return data


class LoadReleaseTableInfo(db.Model):
    TableName = db.Column(db.String(128))
    ReleaseNum = db.Column(db.Integer, primary_key=True)
    LoadDate = db.Column(db.DateTime)
    NRows = db.Column(db.Integer, primary_key=True)
    Type = db.Column(db.String(128))

    def __repr__(self):
        return '<Release {} TableName {}>'.format(self.ReleaseNum, self.TableName)

    def to_dict(self):
        data = {
        'release_num': self.ReleaseNum,
        'table': self.TableName,
        'load_date': self.LoadDate,
        'nrows': self.NRows,
        'type': self.Type
        }
        return data
