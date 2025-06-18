# 🚀 Terraform AWS EC2 Provisioning

## 📚 Documentation Referred

- 🌐 [Terraform Registry](https://registry.terraform.io/)
- 📘 [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---
```sh
########################################################################################
# 🗺️ Architecture Overview
#
#         +----------------------+       terraform apply       +---------------------+
#         |      Developer       |   ----------------------->  |         AWS         |
#         | (You / CI Pipeline)  |                             |    EC2 Instance     |
#         +----------------------+                             +---------------------+
#
########################################################################################
```

########################################################################################
# ⚙️ AWS Provider Configuration
########################################################################################
```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"     # ❌ Replace with env var or profile in real use
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}
```

########################################################################################
# 🖥️ EC2 INSTANCE DEFINITION (first_ec2.tf)
########################################################################################
```sh
resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"      # ✅ Amazon Linux 2 AMI (Example)
  instance_type = "t2.micro"

  tags = {
    Name    = "MyEC2Instance"
    Project = "Terraform-Demo"
    Owner   = "YourName"
  }
}
```

⚠️ Security Tip:

❌ Avoid hardcoding AWS credentials in .tf files.

Use one of the following secure methods instead:

```sh
1. Environment Variables
        export AWS_ACCESS_KEY_ID="your-access-key"
        export AWS_SECRET_ACCESS_KEY="your-secret-key"
2. AWS CLI Credentials File (~/.aws/credentials)
        [default]
        aws_access_key_id = your-access-key
        aws_secret_access_key = your-secret-key
3. Use profile or shared_credentials_file in the Provider Block
        provider "aws" {
        region  = "us-east-1"
        profile = "default"
      }
```
🛠️ Terraform Commands:

```sh
terraform init     - 📦 Initialize the working directory
terraform plan     - 📝 Show the execution plan
terraform apply    - 🚀 Apply the infrastructure changes
terraform destroy  - 🧹 Destroy resources when done
```
