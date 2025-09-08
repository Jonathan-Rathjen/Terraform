resource "aws_sqs_queue" "main" {
    name = format("%s-queue", var.env)
}

variable "env" {
    description = "The environment for the resources"
    type        = string
    default     = "dev"
}