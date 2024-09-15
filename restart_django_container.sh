#!/bin/bash

while true; do
    docker-compose restart django_cont
    sleep 180  # Sleep for 3 minutes
done
