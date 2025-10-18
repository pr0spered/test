#!/bin/bash
# set -e
# exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1
dnf update -y
dnf install -y httpd awscli php php-mysqlnd php-pdo

sleep 60

systemctl enable httpd
systemctl start httpd
aws s3 sync s3://val-01 /var/www/html --delete
# chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# while true; do
#     DB_HOST=$(aws rds describe-db-instances --query "DBInstances[?DBInstanceIdentifier=='ecomm-db-inst'].Endpoint.Address" --output text)
    
#     if [ "$DB_HOST" != "None" ]; then
#         break
#     else
#         sleep 10  # Wait for 10 seconds before retrying
#     fi
# done

# DB_HOST=$(aws rds describe-db-instances --query "DBInstances[?DBInstanceIdentifier=='ecomm-db-inst'].Endpoint.Address" --output text)

cd /var/www/html/database

echo "<?php

class DBController
{
    // Database Connection Properties
    protected \$host = "${db_endpoint}";
    protected \$user = "admin";
    protected \$password = "12345678";
    protected \$database = "shopee";

    // connection property
    public \$con = null;

    // call constructor
    public function __construct()
    {
        \$this->con = mysqli_connect(\$this->host, \$this->user, \$this->password, \$this->database);
        if (\$this->con->connect_error){
            echo "Fail " . \$this->con->connect_error;
        }
    }

    public function __destruct()
    {
        \$this->closeConnection();
    }

    // for mysqli closing connection
    protected function closeConnection(){
        if (\$this->con != null ){
            \$this->con->close();
            \$this->con = null;
        }
    }
}" > DBController.php



# while true; do
#     # Fetch DB Host only if the instance is available
#     DB_HOST=$(aws rds describe-db-instances --query "DBInstances[?DBInstanceIdentifier=='ecomm-db' && DBInstanceStatus=='available'].Endpoint.Address" --output text)

#     # If a valid DB_HOST is returned, create the PHP file
#     if [ "$DB_HOST" != "None" ]; then
#         echo "<?php
# class DBController
# {
#     // Database Connection Properties
#     protected \$host = \"ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com\";
#     protected \$user = \"admin\";
#     protected \$password = \"12345678\";
#     protected \$database = \"shopee\";

#     // connection property
#     public \$con = null;

#     // call constructor
#     public function __construct()
#     {
#         \$this->con = mysqli_connect(\$this->host, \$this->user, \$this->password, \$this->database);
#         if (\$this->con->connect_error){
#             echo \"Fail \" . \$this->con->connect_error;
#         }
#     }

#     public function __destruct()
#     {
#         \$this->closeConnection();
#     }

#     // for mysqli closing connection
#     protected function closeConnection(){
#         if (\$this->con != null ){
#             \$this->con->close();
#             \$this->con = null;
#         }
#     }
# }" > DBController.php
#         break
#     fi

#     # Wait for 60 seconds before retrying
#     sleep 60
# done











# while true; do

#     DB_HOST=$(aws rds describe-db-instances --query "DBInstances[?DBInstanceIdentifier=='ecomm-db-inst'].Endpoint.Address" --output text)

#     echo "<?php


# class DBController
# {
#     // Database Connection Properties
#     protected \$host = \"$DB_HOST\";
#     protected \$user = "admin";
#     protected \$password = "12345678";
#     protected \$database = "shopee";

#     // connection property
#     public \$con = null;

#     // call constructor
#     public function __construct()
#     {
#         \$this->con = mysqli_connect(\$this->host, \$this->user, \$this->password, \$this->database);
#         if (\$this->con->connect_error){
#             echo "Fail " . \$this->con->connect_error;
#         }
#     }

#     public function __destruct()
#     {
#         \$this->closeConnection();
#     }

#     // for mysqli closing connection
#     protected function closeConnection(){
#         if (\$this->con != null ){
#             \$this->con->close();
#             \$this->con = null;
#         }
#     }
# }" > DBController.php
#     if [ "$DB_HOST" != "None" ]; then
#         break
#     else
#         sleep 10  # Wait for 10 seconds before retrying
#     fi
# done







# echo "<?php


# class DBController
# {
#     // Database Connection Properties
#     protected \$host = "$DB_HOST";
#     protected \$user = "admin";
#     protected \$password = "12345678";
#     protected \$database = "shopee";

#     // connection property
#     public \$con = null;

#     // call constructor
#     public function __construct()
#     {
#         \$this->con = mysqli_connect(\$this->host, \$this->user, \$this->password, \$this->database);
#         if (\$this->con->connect_error){
#             echo "Fail " . \$this->con->connect_error;
#         }
#     }

#     public function __destruct()
#     {
#         \$this->closeConnection();
#     }

#     // for mysqli closing connection
#     protected function closeConnection(){
#         if (\$this->con != null ){
#             \$this->con->close();
#             \$this->con = null;
#         }
#     }
# }" > DBController.php


systemctl restart httpd











# # !/bin/bash
# # update the package repository
# sudo dnf update -y
# # install apache
# sudo dnf install httpd -y
# # start and enable apache
# sudo systemctl start httpd
# sudo systemctl enable httpd
# mkdir project
# sudo aws s3 cp s3://val-01 /home/ec2-user/project --recursive
# cp -r /home/ec2-user/project/* /var/www/html/