# 🌱 Experimenting with List Data Types in Terraform

> **Learn how to use Terraform's `list` data type to provision multiple AWS EC2 instances, each with unique instance types and tags.**

---

## 📝 Scenario

You want to create **three EC2 instances** for different environments—`dev`, `stg`, and `prd`—each with its own instance type and tag.

---

## 🛠️ Terraform Example

```hcl
variable "instance_type" {
    type        = list(string)
    default     = ["t2.micro", "t2.small", "t2.medium"]
    description = "List of instance types for each environment"
}

variable "tags" {
    type        = list(string)
    default     = ["dev", "stg", "prd"]
    description = "List of environment tags"
}

resource "aws_instance" "server" {
    count         = 3
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = var.instance_type[count.index]

    tags = {
        Name = var.tags[count.index]
    }
}
```

---

## 💡 How It Works

| **Component**   | **Purpose**                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| `instance_type` | List of EC2 instance types (`t2.micro`, `t2.small`, `t2.medium`)            |
| `tags`          | List of environment names (`dev`, `stg`, `prd`)                             |
| `count`         | Creates three instances, one for each environment                           |
| `count.index`   | Indexes into the lists to assign the correct type and tag to each instance  |

> **Tip:** Lists are zero-indexed, so `count.index` matches each environment to its instance type and tag.

---

## 🖥️ Resulting Resources

| **Instance**   | **Instance Type** | **Environment Tag** |
|:--------------:|:-----------------:|:-------------------:|
| `server[0]`    | `t2.micro`        | `dev`               |
| `server[1]`    | `t2.small`        | `stg`               |
| `server[2]`    | `t2.medium`       | `prd`               |

Each instance is uniquely identified and tagged according to your lists.

---

---

## 📦 Example Terraform Plan Output

```hcl
# aws_instance.server[0] will be created
+ ami           = "ami-0c55b159cbfafe1f0"
+ instance_type = "t2.micro"
+ tags          = { "Name" = "dev" }

# aws_instance.server[1] will be created
+ ami           = "ami-0c55b159cbfafe1f0"
+ instance_type = "t2.small"
+ tags          = { "Name" = "stg" }

# aws_instance.server[2] will be created
+ ami           = "ami-0c55b159cbfafe1f0"
+ instance_type = "t2.medium"
+ tags          = { "Name" = "prd" }

Plan: 3 to add, 0 to change, 0 to destroy.
```



## ✅ Key Takeaways

- **Lists** help manage multiple resources efficiently.
- **Indexing** with `count.index` keeps your configuration DRY and scalable.
- **Tagging** and **instance types** can be easily mapped per environment.

---

> 🚀 **Try customizing the lists to fit your own environments and instance types!**
