variable "env"{
    type = string
    default = "dev"
    description = "The environment to deploy to"
}

variable "ports" {
    type = list(number)
    default = [22, 25, 3306, 3456, 80, 443]
    description = "List of ports to open"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["10.0.0.0/16", "192.168.0.0/24", "10.0.0.0/8", "192.168.2.0/24", "10.0.0.0/8", "172.31.0.0/24"]
    description = "List of CIDR blocks"
}