import os
import pyodbc
import re

def getReportFiles(path):
    reportFiles = []

    for root, dirs, files in os.walk(path):
        for fileName in files:
            if (fileName.endswith('.pdf')):
                reportFiles.append(fileName)

    return reportFiles

def getReportType(fileName):
    fileType = fileName.split('_')[1]

    if (fileType == 'Default'):
        return 1
    elif (fileType == 'Packages'):
        return 2

    raise Exception()

def getReportDate(fileName):
    pattern = r'\d{4}-\d{2}-\d{2}'
    match = re.search(pattern, fileName)
    return match.group()
    

class Database:
    database = None
    cursor = None

    def __init__(self, server, database):
        connection_string = 'DRIVER={SQL Server Native Client 11.0};SERVER=' + server + ';DATABASE=' + database + ';Trusted_Connection=yes;'
        self.database = pyodbc.connect(connection_string)
        self.cursor = self.database.cursor()

    def getReportId(self, date):
        result = self.cursor.execute('SELECT TOP 1 [Id] FROM [Report] WHERE CAST([Date] AS DATE) = \'' + date + '\'')
        
        if (result.rowcount == 0):
            return -1

        id = self.cursor.fetchone()[0]
        return id

    def insertDocument(self, report_id, type_id, file_name, file_directory):
        file_url = file_directory + file_name
        self.cursor.execute('INSERT INTO [ReportDocument]([ReportId], [TypeId], [FileUrl]) VALUES (' + str(report_id) + ', ' + str(type_id) + ', \''+ file_url + '\')')
        self.database.commit()

    def documentExists(self, report_id, type_id):
        self.cursor.execute('SELECT COUNT(*) FROM [ReportDocument] WHERE [ReportId] = ' + str(report_id) + ' AND [TypeId] = ' + str(type_id))
        count = self.cursor.fetchone()[0]
        return count > 0