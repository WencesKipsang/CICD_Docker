
# base python image for custom image
FROM python:3.12.6-alpine

# create working directory and install pip dependencies
WORKDIR  /Django_CICD_app

ENV PYTHONUNBUFFERED = 1

# RUN pip3 install --upgrade pip3

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# copy python project files from local to /hello-py image working directory
COPY . .
RUN  python3  manage.py makemigrations
RUN  python3  manage.py migrate

# run the Django server  
# CMD [  "run", "python3", "manage.py","runserver" "--host=0.0.0.0"]