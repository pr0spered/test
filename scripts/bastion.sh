#!/bin/bash
dnf update -y
dnf install -y mariadb105 awscli
sleep 20
mkdir -p /home/ec2-user/database
aws s3 sync s3://val-01/database/ /home/ec2-user/database/ --delete
echo "DB Endpoint: ${db_endpoint}" > /home/ec2-user/db_endpoint.txt
mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e "CREATE DATABASE \`ecomm-data\`;"
mysql -h "${db_endpoint}" -P 3306 -u admin -p12345678 ecomm-data < /home/ec2-user/database/shopee.sql