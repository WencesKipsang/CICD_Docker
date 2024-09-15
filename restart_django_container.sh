#!/bin/bash

while true; do
    docker restart django_cont
    sleep 120  # Sleep for 32 minutes
done
