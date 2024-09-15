#!/bin/bash

set -x


sudo cp -rf jenkins-docker-gunicorn.socket  /etc/systemd/system/
sudo cp -rf jenkins-docker-gunicorn.service  /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl start jenkins-docker-gunicorn.socket
sudo systemctl enable jenkins-docker-gunicorn.socket

sudo systemctl start jenkins-docker-gunicorn.service
sudo systemctl enable jenkins-docker-gunicorn.service

sudo systemctl daemon-reload

sudo systemctl restart jenkins-docker-gunicorn.socket
sudo systemctl restart jenkins-docker-gunicorn.service
sudo systemctl status jenkins-docker-gunicorn.service

set +x