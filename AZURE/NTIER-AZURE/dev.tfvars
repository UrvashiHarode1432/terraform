
#using this file, then write aply command like ` terraform apply -var-file="dev.tfvars" `
resource_group_name = "ntier-dev"
location            = "ap-south-1"
network_range       = ["10.10.0.0/16"]
