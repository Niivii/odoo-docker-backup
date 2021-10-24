# odoo-docker-backup

Small and simple Go Alpine image to backup odoo postgres database and filestore to google drive.

## What does it do ?

cron a script with logs to docker engine that :
- curl the /web/database/backup of your odoo instance
- use gdrive to push the resulting zip file to your google drive (https://github.com/odeke-em/drive/)
- remove any file older than 30 days

## Requirements

Linux machine with docker installed

## Configuration

You can change the cron to fit your needs.
Don't forget to change your password, database name and url in the script.

## Building the image

```shell
docker build --rm -t backup/cron .
```

## Run the image

```shell
docker run -d backup/cron
```

## Setup gdrive

Attach to the running container :

```shell
docker exec -it <name-of-the-container> /bin/sh
```

Follow the instructions to init gdrive (https://github.com/odeke-em/drive/blob/master/README.md#initializing) :

```shell
gdrive init /root/backups/
```

Go to the url and copy paste the token
