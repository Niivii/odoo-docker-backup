#!/bin/sh

curl -X POST \
  --form-string "master_pwd=P@sSw0rD" \
  --form-string "name=myDatabase" \
  --form-string "backup_format=zip" \
  -o /root/backups/myDatabase.$(date +%F-%H-%M).zip \
  https://myodoowebsite.com/web/database/backup

sleep 1

gdrive push -quiet -destination "IT/Backup Odoo" /root/backups/*

sleep 1

find /root/backups/ -type f -name "*.zip" -mtime +30 -delete
