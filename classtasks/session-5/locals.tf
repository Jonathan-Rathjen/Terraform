// Note: Terraform doesn't let us call a variable within a variable instead we have to use locals

locals {
    name = "${var.env}-${var.cloud_provider}-${var.cloud_region}-${var.business_unit}-${var.project}-${var.tier}-rtype"
    common_tags = {
        Environment   = var.env
        Tier          = var.tier
        Business_Unit = var.business_unit
        Project_Name  = var.project
        Team          = var.team
        Managed_By    = var.managed_by
        Owner         = var.owner
    }
}

// Naming Convention

// Project = "jerry"
// Resource Type = alb, asg, tg, igw, sg
// Enironment = dev, prod, stg, qa
// Region = use1, usw1, usw2, euw1, euc1, apne1, aps1, aps2, sae1
// Tier = frontend, backend, db
// Business Unit = orders, payments, streaming
// Provider = aws, gcp, azure
// name = environment + provider + region + business unit + project + tier + resource
// example = dev-aws-use1-orders-jerry-frontend-alb

// Tagging Convention

// Environment = dev, prod, stg, qa
// Tier = frontend, backend, db
// Business_Unit = order, payments, streaming
// Project_Name = jerry,tom
// Team = devops, platform, security
// Managed_By = terraform, cloudformation, manual
// Owner = email of the owner