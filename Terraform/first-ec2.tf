
########################################################################################
# 🚀 Terraform AWS EC2 Provisioning - All-in-One Visual Guide
########################################################################################

# 📚 Documentation:
#    📘 Terraform Registry       : https://registry.terraform.io/
#    📘 AWS Provider Documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

########################################################################################
# 🗺️ Architecture Overview
#
#         +----------------------+       terraform apply       +---------------------+
#         |      Developer       |   ----------------------->  |         AWS         |
#         | (You / CI Pipeline)  |                             |    EC2 Instance     |
#         +----------------------+                             +---------------------+
#
########################################################################################


########################################################################################
# ⚠️ SECURITY TIP:
# ❌ Avoid hardcoding credentials directly in Terraform files.
# ✅ Use one of the following secure methods:
#     • Environment Variables:
#         export AWS_ACCESS_KEY_ID="your-access-key"
#         export AWS_SECRET_ACCESS_KEY="your-secret-key"
#     • AWS CLI Profile (in ~/.aws/credentials)
#     • Use `shared_credentials_file` or `profile` in provider block if needed
########################################################################################


########################################################################################
# ⚙️ AWS Provider Configuration
########################################################################################

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"     # ❌ Replace with env var or profile in real use
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}


########################################################################################
# 🖥️ EC2 INSTANCE DEFINITION (first_ec2.tf)
########################################################################################

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"      # ✅ Amazon Linux 2 AMI (Example)
  instance_type = "t2.micro"

  tags = {
    Name    = "MyEC2Instance"
    Project = "Terraform-Demo"
    Owner   = "YourName"
  }
}


########################################################################################
# 🛠️ TERRAFORM COMMANDS TO RUN
########################################################################################

# 📦 Initialize the working directory:
# --------------------------------------------------
# terraform init

# 📝 See what Terraform will do before applying:
# --------------------------------------------------
# terraform plan

# 🚀 Apply the changes to provision infrastructure:
# --------------------------------------------------
# terraform apply

# 🧹 To destroy the infrastructure when no longer needed:
# --------------------------------------------------
# terraform destroy


########################################################################################
# ✅ EXPECTED RESULT
########################################################################################

# ✔️ EC2 instance is launched in AWS us-east-1 region
# ✔️ AMI: ami-00c39f71452c08778
# ✔️ Instance Type: t2.micro
# ✔️ Tags: Name=MyEC2Instance, Project=Terraform-Demo, Owner=YourName

########################################################################################
