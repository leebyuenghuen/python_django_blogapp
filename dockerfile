FROM python:3.8-buster
WORKDIR /app/django

RUN pip install --upgrade pip >/dev/null 2>&1

RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser


COPY --chown=myuser:myuser requirements.txt requirements.txt
RUN pip install --user -r requirements.txt
ENV PATH="/home/myuser/.local/bin:${PATH}"

COPY --chown=myuser:myuser . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
