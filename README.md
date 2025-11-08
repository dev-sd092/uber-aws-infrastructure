# 🚗 Uber Clone - AWS Infrastructure

Complete AWS infrastructure for an Uber-like application using Terraform.

## 🏗️ What This Creates

- ✅ VPC with 6 subnets across 2 availability zones
- ✅ Application Load Balancer (high availability)
- ✅ 2 Backend EC2 instances
- ✅ RDS MySQL with Primary + Read Replica
- ✅ Complete security groups
- ✅ NAT Gateways for private subnets

## 📋 Prerequisites

1. AWS Account
2. Terraform installed (v1.0+)
3. AWS CLI configured
```bash
# Check installations
terraform version
aws --version
aws sts get-caller-identity
```

## 🚀 Quick Start

### Step 1: Clone/Create Project
```bash
mkdir uber-aws-infrastructure
cd uber-aws-infrastructure

# Create the folder structure
mkdir -p modules/{vpc,security-groups,alb,compute,rds}
mkdir scripts
```

### Step 2: Copy All Files

Copy all the files from above into their respective locations.

### Step 3: Configure
```bash
# Create your configuration file
cp terraform.tfvars.example terraform.tfvars

# Edit it
nano terraform.tfvars
```

Add your values:
```hcl
aws_region  = "us-east-1"
environment = "dev"
db_password = "YourSecurePassword123!"
my_ip       = "YOUR_IP_HERE/32"  # Get your IP: curl ifconfig.me
```

### Step 4: Deploy
```bash
# Initialize
terraform init

# Preview
terraform plan

# Deploy (takes ~20 minutes)
terraform apply

# Type 'yes' when prompted
```

### Step 5: Test
```bash
# Get the URL
terraform output alb_url

# Test health check
curl $(terraform output -raw alb_url)/health

# Open in browser
open $(terraform output -raw alb_url)
```

## 📊 Architecture
```
Internet → Route 53 → Internet Gateway → ALB (Public Subnets)
                                          ↓
                                    Backend Servers (Private App Subnets)
                                          ↓
                                    RDS Database (Private DB Subnets)
```

## 💰 Monthly Cost

Approximately $140/month:
- EC2 (2x t3.micro): ~$15
- RDS (2x db.t3.micro): ~$30
- NAT Gateways (2x): ~$65
- ALB: ~$20
- Data transfer: ~$10

## 🧹 Cleanup
```bash
terraform destroy
# Type 'yes' to confirm
```

## 📚 What You'll Learn

1. How to structure Terraform projects
2. AWS VPC networking
3. Security groups and access control
4. Load balancing
5. High availability architecture
6. Database replication

## 🆘 Common Issues

**Issue: terraform.tfvars not found**
```bash
cp terraform.tfvars.example terraform.tfvars
# Then edit with your values
```

**Issue: AWS credentials error**
```bash
aws configure
# Enter your access key and secret
```

**Issue: Health checks failing**
Wait 2-3 minutes for instances to fully start, then check again.

## 📖 Next Steps

1. Add HTTPS with ACM certificate
2. Add Auto Scaling
3. Add CloudWatch monitoring
4. Add CI/CD pipeline
5. Add Route53 custom domain