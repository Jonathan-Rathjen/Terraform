# resource aws_s3_bucket main {
#   for_each = var.buckets
#   bucket = each.value
#   tags = {
#     Name = each.key
#   }
# }

# variable "buckets" {
#   type = map(string)
#   default = {
#     bucket-1 = "terraform-session-apr2025-jonathan-1"
#     bucket-2 = "terraform-session-apr2025-jonathan-2"
#   }
# }

// count = main[0], main[1]
// for_each = main["bucket-1"], main["bucket-2"

// Let's create 2 s3 buckets, with each bucket having two tags

resource aws_s3_bucket main2 {
  for_each = var.buckets
  bucket = each.value.name
  tags = {
    Name = each.key
    Env  = each.value.env
  }
  lifecycle {
    create_before_destroy = false
  }
}

variable "buckets" {
  type = map(any)
  default = {
    bucket-1 = {name = "terraform-session-apr2025-jonathan-1", "env" = "dev"}
    bucket-2 = {name = "terraform-session-apr2025-jonathan-2", "env" = "prod"}
  }
}