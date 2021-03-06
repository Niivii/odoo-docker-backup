FROM golang:alpine

RUN apk --update --no-cache add \
    ca-certificates \
    wget \
    curl \
    && update-ca-certificates
RUN wget --progress=dot:giga https://github.com/odeke-em/drive/releases/download/v0.4.0/drive_linux \
&& mv drive_linux /usr/bin/gdrive \
&& chmod +x /usr/bin/gdrive

RUN mkdir /root/backups
COPY backup.sh /root/
RUN chmod +x /root/backup.sh
COPY cron /etc/crontabs/root

CMD ["crond", "-f", "-d", "8"]
