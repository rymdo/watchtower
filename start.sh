#!/bin/sh
FILE=/bin/docker-credential-ecr-login
if test ! -f "$FILE"; then
  wget https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.3.1/linux-amd64/docker-credential-ecr-login
  mv /docker-credential-ecr-login /bin/docker-credential-ecr-login
  chmod +x /bin/docker-credential-ecr-login
fi