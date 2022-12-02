#!/bin/sh
rm -f upload.sql
date=$(date '+%Y-%m-%d')
mysqldump -u <MYSQL_ROOT_USERNAME> -p"<MYSQL_PASSWORD>" "<DATABASE_NAME>" -h <SERVER> >> "backup_$date.sql"
<PATH_TO_UPLOAD>/gdrive upload "backup_$date.sql" -p "<GOOGLE_SERVICE_ACCOUNT_PASSWORD>" --service-account "auth.json"
rm "backup_$date.sql"
