#!/bin/bash

# Set variables
DB_IDENTIFIER="ecomm-db-inst"  # Replace with your RDS instance identifier
OUTPUT_FILE="rds_endpoint.txt"      # File to store the endpoint

echo "Waiting for RDS instance to become available..."

# Loop until RDS is available
while true; do
    # Get RDS status
    STATUS=$(aws rds describe-db-instances \
        --db-instance-identifier $DB_IDENTIFIER \
        --query 'DBInstances[0].DBInstanceStatus' \
        --output text 2>/dev/null)

    if [ "$STATUS" = "available" ]; then
        # Get the endpoint when RDS is available
        ENDPOINT=$(aws rds describe-db-instances \
            --db-instance-identifier $DB_IDENTIFIER \
            --query 'DBInstances[0].Endpoint.Address' \
            --output text)
        
        # Save endpoint to file
        echo $ENDPOINT > $OUTPUT_FILE
        echo "RDS endpoint saved to $OUTPUT_FILE"
        break
    else
        echo "RDS status: $STATUS. Waiting 30 seconds..."
        sleep 30
    fi
done