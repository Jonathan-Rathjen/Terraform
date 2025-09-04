resource "aws_sqs_queue" "main" {
  name = replace(local.name, "rtype", "sqs")
  tags = merge(local.common_tags,{Name = replace(local.name, "rtype", "sqs")})
}

resource "aws_db_instance" "main" {
    allocated_storage = 10
    identifier = replace(local.name, "rtype", "rds")
    db_name = "mydb"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    username = "admin"
    password = random_password.main.result
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = var.env == "Prod" ? false : true // dev != prod => true
    final_snapshot_identifier = var.env == "Prod" ? "${replace(local.name, "rtype", "rds-snapshot")}" : null
}

resource "random_password" "main" {
    length = 16
    special = true
    override_special = "!@#$%&*()-_=+[]{}<>:?"
}
// How to reference a local value

// Bool = true, false | 1, 0 

// Equality operators

// "a" == "b"  => false
// "a" != "b"  => true
// 1 == 1      => true
// b == "b"    => error
// true == false => false

// Conditional Expression: until you have 3 conditions
// Conditional Hell: you have more than 3 conditions

// Syntax:
// condition ? true_val : false_val

// Example:
// "tomato" == "tomateo" ? "yes" : "no" => "no"

// Example:
// 8 != 5 ? "not equal" : "equal" => "not equal"

// Example:
// 8 == 5 ? "no": 8 == 6 ? "no" : 8 == 7 ? "no" : 8 == 8 ? "yes" : "no" => "yes"

// Example:
// var.env != var.project ? var.team : var.business_unit => "DevOps"