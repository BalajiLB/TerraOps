### Documentation Referred:

https://registry.terraform.io/

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

### first_ec2.tf

```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}

```
########################################################################################
# ⚠️ SECURITY TIP:
# ❌ Avoid hardcoding credentials directly in Terraform files.
# ✅ Use one of the following secure methods:
#     • Environment Variables:
#         export AWS_ACCESS_KEY_ID="your-access-key"
#         export AWS_SECRET_ACCESS_KEY="your-secret-key"
#     • AWS CLI Profile (in ~/.aws/credentials)
#     • Use `shared_credentials_file` or `profile` in provider block if needed
### Commands:
```sh

```sh
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

```
