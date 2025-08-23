terraform {
  required_version = "~> 1.13.0" // Terraform version
  required_providers { // Provider Version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.10.0"
    }
  }
}

// Semantic Versioning = 3.24.0
// 3 = Major version,upgrade incompatible API changes
// 24 = Minor version, update functionality in a backwards-compatible manner
// 0 = Patch version, patch backwards-compatible bug fixes