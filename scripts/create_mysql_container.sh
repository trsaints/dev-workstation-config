#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <container_name> <mysql_root_password> <mysql_database> <mysql_user>"
    exit 1
fi

# Assign arguments to variables
CONTAINER_NAME=$1
MYSQL_ROOT_PASSWORD=$2
MYSQL_DATABASE=$3
MYSQL_USER=$4

# Create the MySQL container
docker run --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD -e MYSQL_DATABASE=$MYSQL_DATABASE -e MYSQL_USER=$MYSQL_USER -d mysql:latest

# Check if the container was created successfully
if [ $? -eq 0 ]; then
    echo "MySQL container '$CONTAINER_NAME' created successfully."
else
    echo "Failed to create MySQL container."
    exit 1
fi