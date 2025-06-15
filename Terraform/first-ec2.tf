#############################################
# 🚀 Terraform AWS EC2 Provisioning Example #
#############################################

# 📚 Documentation Referred:
# - Terraform Registry: https://registry.terraform.io/
# - AWS Provider Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

####################################
# ⚙️ Provider Configuration
####################################

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"   # ❌ Do NOT commit real credentials
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

# 🛑 NOTE:
# It's a bad practice to hardcode AWS credentials.
# Instead, use environment variables or AWS credentials file:
# export AWS_ACCESS_KEY_ID="your-access-key"
# export AWS_SECRET_ACCESS_KEY="your-secret-key"

####################################
# 🖥️ EC2 Instance Resource
####################################

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"  # ✅ Amazon Linux 2 AMI (Example)
  instance_type = "t2.micro"
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
