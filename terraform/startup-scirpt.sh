#!/bin/bash

# Update system
apt-get update
apt-get install -y curl nginx mysql-client

# Start nginx
systemctl start nginx
systemctl enable nginx

# Create health check endpoint
cat > /var/www/html/index.html << 'INNER_EOF'
<!DOCTYPE html>
<html>
<head><title>Disaster Recovery Demo</title></head>
<body>
<h1>Disaster Recovery Server</h1>
<p>Region: East/West US</p>
<p>Status: Healthy</p>
</body>
</html>
INNER_EOF

chmod 644 /var/www/html/index.html
EOF