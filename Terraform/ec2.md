# 🚀 Terraform AWS EC2 Provisioning

## 📚 Documentation Referred

- 🌐 [Terraform Registry](https://registry.terraform.io/)
- 📘 [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## 📄 `first_ec2.tf`

```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
}
```

⚠️ Security Tip
❌ Avoid hardcoding AWS credentials in .tf files.
✅ Use one of the following secure methods instead:

```sh
Environment variables:
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
AWS CLI config (~/.aws/credentials)
shared_credentials_file or profile in the provider block
```

🛠️ Terraform Commands
```sh
# 📦 Initialize the working directory
terraform init

# 📝 Show the execution plan
terraform plan

# 🚀 Apply the infrastructure changes
terraform apply

# 🧹 Destroy resources when done
terraform destroy
```

