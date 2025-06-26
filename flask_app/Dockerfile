FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install flask flask-cors pymysql cryptography
COPY . .
CMD ["python", "app.py"]
