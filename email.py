# import boto3
# import pymysql

# # Database connection details
# db_host = ''
# db_user = 'admin'
# db_password = '12345678'
# db_name = 'shopee'

# # Connect to the RDS instance
# connection = pymysql.connect(host=db_host, user=db_user, password=db_password, db=db_name)

# # Query to get the email address
# cursor = connection.cursor()
# cursor.execute("SELECT email FROM your_table WHERE condition='your_condition' LIMIT 1")
# email = cursor.fetchone()[0]  # Assuming the email is in the first column

# # Return or print the email address
# print(email)

# # Close the connection
# cursor.close()
# connection.close()
