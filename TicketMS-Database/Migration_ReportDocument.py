import sys
import os
import MigrationUtils

directory = sys.argv[1]
server = sys.argv[2]
database = sys.argv[3]
file_directory = sys.argv[4]

print('Directory: ' + directory + '. Server: ' + server + '. DB: ' + database + '. Directory: ' + file_directory)

report_files = MigrationUtils.getReportFiles(directory)
print(report_files)

db_connection = MigrationUtils.Database(server, database)

migrated_count = 0

print('Report documents migration is starting...\n')

for report in report_files:
    print('File: ' + report)

    date = MigrationUtils.getReportDate(report)
    rep_type = MigrationUtils.getReportType(report)
    rep_id = db_connection.getReportId(date)

    if (rep_id == -1):
        print('Report is not found')
        continue

    print('ReportId: ' + str(rep_id) + '. ReportType: ' + str(rep_type) + '. Date: ' + date)

    if (db_connection.documentExists(rep_id, rep_type) == False):
        db_connection.insertDocument(rep_id, rep_type, report, file_directory)

        print('ReportId: ' + str(rep_id) + ' - migrated')
        migrated_count = migrated_count + 1

print('Migration has been finished. Files migrated: ' + str(migrated_count))
os.system('pause')
