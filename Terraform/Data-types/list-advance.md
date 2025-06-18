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