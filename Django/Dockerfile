
# base python image for custom image
FROM python:3.12-alpine

# create working directory and install pip dependencies
WORKDIR  /Django_CICD_app

ENV PYTHONUNBUFFERED = 1

# RUN pip3 install --upgrade pip3

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt --no-cache-dir

# copy python project files from local to  image working directory
COPY . .
RUN python3  manage.py collectstatic --noinput

# run the Django server 
 
# CMD [  "run", "python3", "manage.py","runserver" "--host=0.0.0.0"]