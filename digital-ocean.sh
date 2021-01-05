#!/bin/bash

# Please register on Digital Ocean https://www.digitalocean.com/ then:
# Create a token here https://cloud.digitalocean.com/settings/api/tokens

# NOTICE: ***DO NOT*** share your private token as others can use it
# Sharing your private "DigitalOcean_TOKEN" allows others to create servers which may charge your credit card!

# Please enter your token in the following quotes, it should be ~64 chacters long.
DigitalOcean_TOKEN="1faa9db1ce7547f8bfe236be8fcf1b4981c6210cae1da5e65asdasdaabae3abf93" # Never share this token.

if [[ ${#DigitalOcean_TOKEN} < 60 ]]; then # This function counts the length of the DigitalOcean_TOKEN to ensure it's the correct character length
    echo "Incorrect DigitalOcean_TOKEN character length of [${DigitalOcean_TOKEN}] characters. It must be 64 characters long."
    echo "Exiting"
    exit 0
fi

# Please select which server region you'd like to deploy the server.
# The following 4 digit codes are regions you can choose to deploy the server.
# Please choose the relevant server area and copy it into the following ServerRegion=""

# https://www.digitalocean.com/docs/platform/availability-matrix
# NYC1, NYC2, NYC3: New York City, United States
# AMS2, AMS3: Amsterdam, the Netherlands
# SFO1, SFO2, SFO3: San Francisco, United States
# SGP1: Singapore
# LON1: London, United Kingdom
# FRA1: Frankfurt, Germany
# TOR1: Toronto, Canada
# BLR1: Bangalore, India

ServerRegion="" # Please fill this (read above information)

# NOTICE:
# If you have not filled the Server Region it will default to NYC1 (New York City 1)
if [[ ! ServerRegion ]]; then;
    echo "No ServerRegion was input, defaulting to NYC1"
    ServerRegion="NYC1"
fi

# Deploy DigitalOcean server
echo "Deploying DigitalOcean Server..."
# Please allow ~2 minutes for the server to deploy.
docker-machine create --driver=digitalocean \\
    --digitalocean-access-token="${DigitalOcean_TOKEN}" \\
    --digitalocean-region "${ServerRegion}" \\
    --digitalocean-ipv6 \\ # Adds optional ipv6 address
    --digitalocean-size=1gb \\
    --digitalocean-image "debian-10-x64" docker

# The follow two commands can be used to deploy a local server:
# docker-compose -f docker-compose.yml build # build docker containers
# docker-compose -f docker-compose.yml up -d # start docker containers