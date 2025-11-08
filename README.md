# 🚖 Uber Clone AWS Infrastructure (Terraform + AWS)

## 📘 Overview
This project automates the complete **AWS infrastructure setup** for a containerized **Uber Clone application** using **Terraform (IaC)**.  
It provisions networking, security, compute, and load balancing layers required to deploy a scalable, production-grade application.

The goal of this project is to demonstrate **real-world DevOps and AWS infrastructure design** with a clean, reusable Terraform setup — suitable for **CI/CD pipelines** and **multi-environment deployments**.

---

## 🏗️ Architecture Overview

### **High-Level Design**
The infrastructure follows a **3-tier VPC architecture**:
- **VPC** with public and private subnets across multiple Availability Zones.
- **Internet Gateway** for public access.
- **NAT Gateway** for private subnet outbound connectivity.
- **EC2 Instances** (application tier) managed under an **Auto Scaling Group**.
- **Application Load Balancer (ALB)** to distribute traffic.
- **Target Groups** for health-checked instance routing.
- **Security Groups** for network isolation.
- **Route Tables** for controlled routing between tiers.

---

## 🧩 Infrastructure Components

| Component | Description |
|------------|-------------|
| **VPC** | Custom Virtual Private Cloud for Uber clone environment. |
| **Subnets** | Public and private subnets across multiple AZs. |
| **Internet Gateway** | Enables inbound/outbound internet access for public resources. |
| **NAT Gateway** | Provides outbound access for private instances. |
| **Route Tables** | Configured for public and private subnet routing. |
| **Security Groups** | Fine-grained inbound/outbound rules for ALB and EC2. |
| **Application Load Balancer (ALB)** | Distributes traffic evenly across EC2 instances. |
| **Target Groups** | Manages backend instance registration and health checks. |
| **EC2 Instances** | Hosts the Uber clone application. |
| **Elastic IP** | Used for NAT Gateway or static public access. |

---

## 🧰 Tools & Technologies

| Category | Tool |
|-----------|------|
| **Infrastructure as Code** | Terraform (v1.0+) |
| **Cloud Provider** | AWS |
| **Compute** | EC2 |
| **Networking** | VPC, Subnets, Route Tables, IGW, NAT |
| **Load Balancing** | Application Load Balancer |
| **Version Control** | Git & GitHub |
| **Operating System** | Amazon Linux 2 |

---

## 🪜 Terraform Workflow

Below are the Terraform stages executed during the deployment:

| Step | Command | Screenshot |
|------|----------|-------------|
| **1. Initialize Terraform** | `terraform init` | <img width="940" height="486" alt="image" src="https://github.com/user-attachments/assets/02b62cc3-7256-440b-b66f-59d254a8b391" />|
| **2. Validate Configuration** | `terraform validate` | <img width="940" height="86" alt="image" src="https://github.com/user-attachments/assets/7931c4ba-ede1-4611-827b-6b1c8594be90" /> |
| **3. Plan Deployment** | `terraform plan` |<img width="940" height="239" alt="image" src="https://github.com/user-attachments/assets/b889795e-5c23-4b7b-b731-94e3a3bdfd64" />
<img width="940" height="157" alt="image" src="https://github.com/user-attachments/assets/592e2b78-ac9a-4729-83a5-cd85c5ec9aa2" /> |
| **4. Apply Infrastructure** | `terraform apply -auto-approve` | <img width="940" height="236" alt="image" src="https://github.com/user-attachments/assets/968517c7-7e4a-41a5-8e27-31f113769d2d" />
 <img width="940" height="267" alt="image" src="https://github.com/user-attachments/assets/280340d9-8c83-4136-ac79-15f98dd2d6d7" /> |
| **5. Application Running** | Verified successful deployment on EC2 instance | <img width="940" height="505" alt="image" src="https://github.com/user-attachments/assets/ac71ed46-c1f2-4080-b7d4-bd14f5f85917" /> |
| **6. Instances Created** | <img width="940" height="164" alt="image" src="https://github.com/user-attachments/assets/6279d04c-3d8a-4875-9bb6-05c0a297ef1c" /> |
| **7. Load Balancer Configured** | <img width="940" height="152" alt="image" src="https://github.com/user-attachments/assets/8d39f7d6-a5db-4d05-a614-6cb4fe86730b" /> |
| **8. Target Group Health Checks** | <img width="940" height="137" alt="image" src="https://github.com/user-attachments/assets/b0e9f1d7-0a9d-4132-94fa-dfd59c297cc5" /> |
| **9. Security Groups Configuration** | <img width="940" height="213" alt="image" src="https://github.com/user-attachments/assets/495454f7-5627-4d58-b076-25c715de116d" /> |
| **10. VPC Details** | <img width="940" height="144" alt="image" src="https://github.com/user-attachments/assets/65c50d01-ec12-4e52-9426-2dd9d03986cb" /> |
| **11. VPC Resource Map** |<img width="940" height="314" alt="image" src="https://github.com/user-attachments/assets/ed65b24d-4968-4a36-b0da-97919ee93099" /> |
| **12. Subnets within VPC** |<img width="940" height="195" alt="image" src="https://github.com/user-attachments/assets/6f3c8e7c-e8ce-4852-817e-08a9615cde9d" /> |
| **13. Route Tables** |<img width="940" height="199" alt="image" src="https://github.com/user-attachments/assets/c1c24323-5909-448a-9509-c66f4c388206" />|
| **14. Internet Gateway** |<img width="940" height="106" alt="image" src="https://github.com/user-attachments/assets/c378919b-4f7a-4b88-a2b7-167b4c2b3df3" />|
| **15. NAT Gateway** | <img width="940" height="112" alt="image" src="https://github.com/user-attachments/assets/3e120818-acb4-42b1-b0b9-87032139cf90" /> |
| **16. Clean-up** | `terraform destroy -auto-approve` | <img width="940" height="201" alt="image" src="https://github.com/user-attachments/assets/7041adc2-c417-468e-a561-0957529a89ca" />|

---

## 🌐 Network Architecture Diagram
<img width="774" height="574" alt="Screenshot 2025-11-07 210654" src="https://github.com/user-attachments/assets/2df7951f-24c2-4b92-b5f9-5c56862708b4" />

---

## 🚀 How to Reproduce

### Prerequisites
- Terraform v1.0+
- AWS CLI configured with valid IAM credentials
- S3 bucket for Terraform remote backend (optional)
- Proper IAM permissions for EC2, VPC, and networking resources

### Steps

# 1. Clone the repository
git clone https://github.com/dev-sd092/uber-aws-infrastructure.git
cd uber-aws-infrastructure

# 2. Initialize Terraform
terraform init

# 3. Validate configuration
terraform validate

# 4. Review the execution plan
terraform plan

# 5. Deploy infrastructure
terraform apply -auto-approve

# 6. Destroy resources (cleanup)
terraform destroy -auto-approve

---

📊 Outputs

After a successful terraform apply, you’ll get key outputs such as:

ALB DNS Name
EC2 Instance IDs
VPC ID
Subnet IDs
Security Group IDs
These can be used to connect your Uber Clone frontend or backend application.

---

🧹 Clean-Up
To avoid unwanted AWS costs:

terraform destroy -auto-approve

---

🎯 Learning Objectives / Interview Value

This project demonstrates:

Hands-on Terraform automation for a real-world use case.
AWS networking & compute orchestration using IaC.
Understanding 3-tier cloud architecture with isolation and scalability.
Proper use of Terraform modules, variables, and outputs.
Infrastructure lifecycle management (init → validate → apply → destroy).
Cost-aware provisioning and clean-up best practices.

---

🧑‍💻 Author

Sanket Desai. (DevOps Engineer)
💼 Passionate about Cloud Infrastructure, Automation, and DevSecOps.
📧 Reach out for collaboration: [your-email@example.com]
🔗 LinkedIn Profile
