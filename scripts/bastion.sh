#!/bin/bash

dnf update -y

dnf install -y mariadb105 awscli

sleep 20

mkdir -p /home/ec2-user/database

aws s3 sync s3://val-01/database/ /home/ec2-user/database/ --delete

echo "DB Endpoint: ${db_endpoint}" > /home/ec2-user/db_endpoint.txt

mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e "CREATE DATABASE \`ecomm-data\`;"

mysql -h "${db_endpoint}" -P 3306 -u admin -p12345678 ecomm-data < /home/ec2-user/database/shopee.sql












# mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 ecomm-db < /home/ec2-user/database/shopee.sql


# mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p


# mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e "CREATE DATABASE \`ecomm-db\`;"
# mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e CREATE DATABASE IF NOT EXISTS ecomm-db









#     1  cd
#     2  ls
#     3  cd database/
#     4  ls
#     5  echo "$db_endpoint"
#     6  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p 12345678
#     7  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p
#     8  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p 12345678 ecomm-db < /home/ec2-user/database/shopee.sql
#     9  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 ecomm-db < /home/ec2-user/database/shopee.sql
#    10  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 < /home/ec2-user/database/shopee.sql
#    11  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 < /home/ec2-user/database/shopee.sql ecomm-db
#    12  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 < /home/ec2-user/database/shopee.sql shopee-db
#    13  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 < /home/ec2-user/database/shopee.sql shopee_db
#    14  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 ecomm-db < /home/ec2-user/database/shopee.sql
#    15  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p
#    16  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e CREATE DATABASE IF NOT EXISTS ecomm-db
#    17  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e CREATE DATABASE ecomm-db
#    18  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 -e "CREATE DATABASE \`ecomm-db\`;"
#    19  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p
#    20  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p12345678 ecomm-db < /home/ec2-user/database/shopee.sql
#    21  mysql -h ecomm-db.cxe4e8y8g5vx.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -p
#    22  history