FROM python:3.8-buster
WORKDIR /app/django

RUN python -m pip install --upgrade pip
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

CMD ["gunicorn","one2three.wsgi:application","--bind","0.0.0.0"]