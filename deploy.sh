#!/bin/bash
# Deployment script for Web GIS project on Amazon Linux EC2 with static IP and httpd
# Usage: sudo ./deploy.sh

# Update system
sudo yum update -y

# Install Apache (httpd)
echo "########################################"
sudo yum install -y httpd
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Set up firewall to allow HTTP traffic
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Deploy web files (assumes script is run from project root)
sudo cp index.html /var/www/html/
sudo cp app.js /var/www/html/
sudo cp style.css /var/www/html/

# Set permissions
sudo chown apache:apache /var/www/html/index.html /var/www/html/app.js /var/www/html/style.css
sudo chmod 644 /var/www/html/index.html /var/www/html/app.js /var/www/html/style.css

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
sudo systemctl restart httpd
echo

echo "Deployment complete. Access your site via the EC2 public IP or static Elastic IP."
