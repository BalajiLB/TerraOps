## 🚀 Terraform AWS EC2 Provisioning

### 📚 Documentation Referred:

- 📄 [Terraform Registry](https://registry.terraform.io/)
- 🏗️ [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

### 📄 `first_ec2.tf`

```hcl
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"   # ❌ Do NOT commit credentials in real use
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
}
🛑 Note: Use environment variables or AWS credentials file instead of hardcoding secrets.

🛠️ Terraform Commands
```hcl
terraform init    # 🔧 Initialize the working directory
terraform plan    # 📝 Show execution plan
terraform apply   # 🚀 Apply the changes

✅ Output
After running the above commands, an EC2 instance will be launched in the us-east-1 region.
