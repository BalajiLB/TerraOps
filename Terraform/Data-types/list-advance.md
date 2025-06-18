# Experimenting with List Data Types in Terraform

This example shows, how to use **list** data types in Terraform to create several AWS EC2 instances. Each instance will have a different type and a tag for its environment.

## Scenario

We have two lists: one with "environment" names and one with "instance types". 

We will use these lists to create three EC2 instances. Each instance will be tagged with its "environment" name.

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

**How it works:**

- The `instance_types` variable is a list of EC2 instance types.
- The `environments` variable is a list of environment names.
- The `common_tags` variable is a map of tags that will be added to every instance.
- The `aws_instance` resource uses the `count` argument to create one instance for each item in the `instance_types` list.
- Each instance gets its type and environment tag from the lists, using the current index.
- The `tags` block combines the common tags with a unique name and environment for each instance.

This makes it easy to manage multiple resources with different settings using lists in Terraform.