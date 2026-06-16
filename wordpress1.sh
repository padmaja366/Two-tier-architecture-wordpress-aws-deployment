#!/bin/bash

#update the packages
sudo yum update -y
#install httpd
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
# Install PHP and MariaDB (if not already done)
sudo dnf install -y php-fpm php-mysqli php-json php mariadb105-server
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
#download wordpress
cd /var/www/html/
sudo wget https://wordpress.org/latest.tar.gz
ls -lart
sudo tar -xzvf latest.tar.gz 
ls -lart
cd wordpress/
ls -lart
sudo cp wp-config-sample.php wp-config.php
sudo chown -R apache:apache /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress

echo "========================================="
echo "✅ DEPLOYMENT COMPLETE!"
echo "========================================="
echo "📂 WordPress Location: /var/www/html/wordpress/"
echo ""
echo "⚠️  NEXT STEPS:"
echo "   1. Edit database credentials:"
echo "      sudo nano /var/www/html/wordpress/wp-config.php"
echo ""
echo "   2. Update these values in wp-config.php:"
echo "      define('DB_NAME', 'your_database_name');"
echo "      define('DB_USER', 'your_db_username');"
echo "      define('DB_PASSWORD', 'your_db_password');"
echo "      define('DB_HOST', 'your-rds-endpoint');"
echo