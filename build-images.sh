#!/bin/bash

# Build images

docker build --no-cache -t fabricio-calculator services/calculator/
docker build --no-cache -t fabricio-addition services/addition/
docker build --no-cache -t fabricio-base services/base/
docker build --no-cache -t fabricio-client services/client/
docker build --no-cache -t fabricio-division services/division/
docker build --no-cache -t fabricio-multiplication services/multiplication/
docker build --no-cache -t fabricio-remainder services/remainder/
docker build --no-cache -t fabricio-subtraction services/subtraction/
