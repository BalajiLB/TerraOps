# Experimenting with List Data Types in Terraform

This example demonstrates how to use **list** data types in Terraform to provision multiple AWS EC2 instances, each with a different instance type and tag.

## Scenario

We have a list of environment names and a corresponding list of instance types. We'll use these lists to create three EC2 instances, each tagged for its environment.

## Terraform Example

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

## Explanation

- **Variables**:  
    - `instance_type`: List of EC2 instance types.
    - `tags`: List of environment names.
- **Resource**:  
    - Uses `count` to create three instances.
    - Each instance gets its type and tag from the corresponding list element.

> **Tip:** Lists are indexed starting at 0, so `count.index` matches each environment to its instance type.
