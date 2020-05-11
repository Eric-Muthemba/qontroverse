FROM python:3.6-alpine

RUN adduser -D Qontroverse

WORKDIR /home/Qontroverse

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY Qontroverse.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP Qontroverse.py

RUN chown -R Qontroverse:Qontroverse ./
USER Qontroverse

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
