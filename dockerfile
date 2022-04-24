FROM python:3.8-buster
WORKDIR /app/django

RUN python -m pip install --upgrade pip >/dev/null 2>&1
COPY requirements.txt ./
RUN pip install -r requirements.txt >/dev/null 2>&1
COPY . .


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
