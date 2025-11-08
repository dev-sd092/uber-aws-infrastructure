#!/bin/bash
yum update -y
yum install -y nginx

cat > /usr/share/nginx/html/health << 'EOF'
OK
EOF

INSTANCE_ID=$(ec2-metadata --instance-id | cut -d " " -f 2)
AZ=$(ec2-metadata --availability-zone | cut -d " " -f 2)

cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Uber Clone Backend</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 50px;
            border-radius: 20px;
        }
        h1 { font-size: 3em; }
        .info { font-size: 1.2em; margin: 10px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚗 Uber Clone Backend</h1>
        <div class="info"><strong>Instance:</strong> $INSTANCE_ID</div>
        <div class="info"><strong>AZ:</strong> $AZ</div>
        <div class="info"><strong>Database:</strong> ${db_endpoint}</div>
        <div class="info" style="color: #00ff00;">✓ RUNNING</div>
    </div>
</body>
</html>
EOF

systemctl start nginx
systemctl enable nginx