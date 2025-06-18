# Experimenting with Map Data Types in Terraform

This example demonstrates how to use a map variable in Terraform to create multiple AWS EC2 instances, each with a different instance type and tag based on environment.

---

## Scenario

We have a map of environment names to instance types. We'll create one instance per environment, using the map to set both the instance type and the `Name` tag.

---

## Terraform Configuration

```hcl
variable "env_instance_types" {
  description = "Map of environment names to instance types"
  type        = map(string)
  default = {
    dev = "t2.micro"
    stg = "m4.large"
    prd = "c5.xlarge"
  }
}

resource "aws_instance" "server" {
  count         = length(var.env_instance_types)
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = values(var.env_instance_types)[count.index]
  tags = {
    Name = keys(var.env_instance_types)[count.index]
  }
}
```

---

## Expected Terraform Plan Output

```txt
Terraform will perform the following actions:

  # aws_instance.server[0] will be created
  + instance_type = "t2.micro"
  + tags = {
      + "Name" = "dev"
    }

  # aws_instance.server[1] will be created
  + instance_type = "c5.xlarge"
  + tags = {
      + "Name" = "prd"
    }

  # aws_instance.server[2] will be created
  + instance_type = "m4.large"
  + tags = {
      + "Name" = "stg"
    }

Plan: 3 to add, 0 to change, 0 to destroy.
```

---

## 🖥️ Resulting Resources

After applying, you will have **three EC2 instances**:

| Environment | Instance Type | Name Tag  |
|-------------|--------------|-----------|
| dev         | t2.micro     | dev       |
| stg         | m4.large     | stg       |
| prd         | c5.xlarge    | prd       |

---

> **Tip:**  
> The order of resources is determined by the order of keys/values in the map, which is not guaranteed. If you need a specific order, consider using a list of objects instead.

