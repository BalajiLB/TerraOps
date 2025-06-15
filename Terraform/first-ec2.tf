########################################################################################
# 🚀 Terraform AWS EC2 Provisioning - All-in-One Visual Guide
########################################################################################

# 📚 Documentation:
#    📘 Terraform Registry: https://registry.terraform.io/
#    📘 AWS Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
########################################################################################
# 🗺️ Architecture Overview
#
#         +----------------------+       terraform apply       +---------------------+
#         |      Developer       |   ----------------------->  |         AWS         |
#         | (You / CI Pipeline)  |                             |    EC2 Instance     |
#         +----------------------+                             +---------------------+
#
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
# ⚙️ AWS Provider Configuration
########################################################################################

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"   # ❌ Do NOT commit real credentials
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}
####################################
# 🖥️ EC2 Instance Resource
####################################

# main.tf

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name    = "MyEC2Instance"
    Project = "Terraform-Demo"
    Owner   = "YourName"
  }
}


####################################
# 🛠️ Terraform Commands to Run
####################################

# Run the following commands in your terminal:

# terraform init    # 🔧 Initialize the working directory
# terraform plan    # 📝 Show execution plan
# terraform apply   # 🚀 Apply the changes

####################################
# ✅ Expected Output
####################################

# After running the above commands,
# an EC2 instance will be launched in the `us-east-1` region.
