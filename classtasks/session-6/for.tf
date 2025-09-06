resource "aws_sqs_queue" "name" {
    for_each = toset(var.names)
    name = each.value
}

// I would like to have 3 sqs queses, with names queue-1, queue-2, queue-3
variable  "names" {
    type = list(string)
    default = ["queue-1", "queue-2", "queue-3"]
}

// Difference between set of strings and list of strings
// sets of strings do not allow duplicates, lists allow duplicates
// sets of strings do not have order, lists have order

// Example using for instead of for_each

resource "aws_sqs_queue" "main" {
    for_each = toset(local.names)
    name = each.key    
}

locals {
    names = [for i in range(1,3) : "new-queue-${i}"]
}