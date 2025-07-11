# WebGIS_Project-Deploy_on_AWS-EC2-
A simple Web GIS ( Leaflet ) project deployment on AWS ( ec2 )

# Web GIS Project Deployment Guide
This guide explains how to deploy the Web GIS project on an Amazon Linux EC2 instance using Apache (httpd) and a static (Elastic) IP.

## Prerequisites

- Amazon Linux EC2 instance (t2.micro or higher)
- Security group allowing HTTP (port 80) and SSH (port 22)
- Elastic IP allocated and associated with your EC2 instance
- Project files: `index.html`, `app.js`, `style.css`, `deploy.sh`

## Steps

1. **Connect to your EC2 instance:**

   ```sh
   ssh -i <your-key.pem> ec2-user@<your-ec2-public-ip>
   ```

2. **Upload project files:**
   Use `scp` or SFTP to upload all project files to your EC2 instance, e.g.:

   ```sh
   scp -i <your-key.pem> * ec2-user@<your-ec2-public-ip>:/home/ec2-user/webgis/
   ```

3. **Run the deployment script:**

   ```sh
   cd webgis
   chmod +x deploy.sh
   sudo ./deploy.sh
   ```

4. **Access your Web GIS app:**
   Open a browser and go to:
   ```
   http://<your-elastic-ip>/
   ```

## Notes

- If you update your project files, re-run the deployment script.
- Make sure your security group allows inbound HTTP (port 80).
- For production, consider using HTTPS and securing your server.

---

© 2025 Kunal Chinche
