#!/bin/bash
set -xe

# Variables passed from Terraform
RDS_ENDPOINT="${rds_endpoint}"

# Wait for RDS to become reachable (MySQL port 3306)
echo "Waiting for RDS endpoint ($RDS_ENDPOINT) to be reachable..."
until nc -zv "$RDS_ENDPOINT" 3306 >/dev/null 2>&1; do
  echo "RDS not ready yet... sleeping 10 seconds."
  sleep 10
done

echo "RDS is reachable. Writing to PHP config file."

# Write endpoint into PHP config
cat <<EOF >/var/www/html/config.php
<?php
\$db_host = '${RDS_ENDPOINT}';
\$db_user = 'admin';
\$db_pass = 'changeme123';
\$db_name = 'myappdb';
?>
EOF

# Restart web service (Apache as example)
systemctl restart httpd