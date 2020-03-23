#!/bin/sh

# Exit immediately if a command fails
set -e

heroku pg:backups:capture
database_url=$(heroku pg:backups:url)
filename=$(date -u +%Y-%m-%d_%H-%M-%S)
curl -o $filename.dump $database_url
aws s3 cp $filename.dump s3://takeyourtemp.org/$filename.dump
