# 🚀 Experimenting with List Data Types in Terraform

> **Learn how to use Terraform lists to efficiently manage multiple AWS EC2 instances with different types and tags.**

---

## 📝 Scenario

Suppose you want to create **three EC2 instances**—each with a different instance type and environment tag. You have:

- A list of **environment names**
- A list of **instance types**

Terraform will use these lists to configure and tag each instance automatically.

---

## 📦 Terraform Example

```hcl
variable "instance_types" {
    type        = list(string)
    default     = ["t2.micro", "t2.small", "t2.medium"]
    description = "List of instance types for each environment"
}

variable "environments" {
    type        = list(string)
    default     = ["dev", "stg", "prd"]
    description = "List of environment names"
}

variable "common_tags" {
    type        = map(string)
    default     = {
        Project = "MyProject"
        Owner   = "TeamA"
    }
    description = "Common tags applied to all instances"
}

resource "aws_instance" "server" {
    count         = length(var.instance_types)
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = var.instance_types[count.index]

    tags = merge(
        var.common_tags,
        {
            Name        = "server-${var.environments[count.index]}"
            Environment = var.environments[count.index]
        }
    )
}
```

---

## 🔍 How It Works

- **`instance_types`**: List of EC2 instance types.
- **`environments`**: List of environment names.
- **`common_tags`**: Map of tags applied to all instances.
- **Resource `count`**: Creates one instance per list item.
- **Dynamic tags**: Each instance gets a unique name and environment tag.

---

## 🖥️ Resulting Resources

| Index | Instance Type | Environment | Name Tag      | Common Tags         |
|-------|--------------|-------------|---------------|---------------------|
| 0     | t2.micro     | dev         | server-dev    | Project, Owner      |
| 1     | t2.small     | stg         | server-stg    | Project, Owner      |
| 2     | t2.medium    | prd         | server-prd    | Project, Owner      |

---

## 📤 Example Terraform Plan Output

```hcl
# aws_instance.server[0] will be created
+ instance_type = "t2.micro"
+ tags = {
        "Environment" = "dev"
        "Name"        = "server-dev"
        "Owner"       = "TeamA"
        "Project"     = "MyProject"
    }

# aws_instance.server[1] will be created
+ instance_type = "t2.small"
+ tags = {
        "Environment" = "stg"
        "Name"        = "server-stg"
        "Owner"       = "TeamA"
        "Project"     = "MyProject"
    }

# aws_instance.server[2] will be created
+ instance_type = "t2.medium"
+ tags = {
        "Environment" = "prd"
        "Name"        = "server-prd"
        "Owner"       = "TeamA"
        "Project"     = "MyProject"
    }

Plan: 3 to add, 0 to change, 0 to destroy.
```

---

> **Tip:** Using lists and maps in Terraform lets you scale your infrastructure with minimal code changes!
