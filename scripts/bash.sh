#!/bin/bash
dnf update -y
dnf install -y httpd awscli php php-mysqlnd
sleep 20
systemctl enable httpd
systemctl start httpd
aws s3 sync s3://val-01 /var/www/html --delete
chmod -R 755 /var/www/html
sed -i "s|<host>|${db_endpoint}|" /var/www/html/database/DBController.php
systemctl restart httpd