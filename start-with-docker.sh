#!/bin/bash

sudo docker build -t test-server-jay:test .
sudo docker compose -f ./docker-compose.yml up -d