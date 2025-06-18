# Experimenting with Map Data Types in Terraform

This example demonstrates how to use a map variable in Terraform to provision AWS EC2 instances with different instance types based on environment names.

## Scenario

We have a map of environment names to instance types. We'll create one instance per environment, using the corresponding instance type.

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
    Environment = keys(var.env_instance_types)[count.index]
  }
}
```

## Key Points

- **Map Variable:** The `env_instance_types` variable defines a map of environment names to instance types.
- **Dynamic Resource Creation:** The `count` meta-argument creates one instance per map entry.
- **Accessing Keys and Values:** `keys()` and `values()` functions are used to assign the correct name and instance type to each resource.

> **Tip:** Always ensure the order of `keys()` and `values()` matches when using them with `count.index`.

