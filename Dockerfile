FROM python:3.13-alpine

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8000/tcp

STOPSIGNAL SIGINT
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
