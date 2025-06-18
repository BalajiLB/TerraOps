# Here we do experiment with map data types in terraform.
```sh
# Scenario: We have a map of environment names to instance types. Will try to create instances based on this map.
```
```sh
resource "aws_instance" "server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = values(var.map)[count.index]
  count = 3
    tags = {
        Name = keys(var.map)[count.index]
    }
}

variable "map" {
    type = map(string)      
     default = {
        "dev" = "t2.micro" 
        "stg" = "m4.large"
        "prd" = "c5.xlarge"   
        }
  
}
```
