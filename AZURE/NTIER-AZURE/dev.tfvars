
#using this file, then write aply command like ` terraform apply -var-file="dev.tfvars" `
resource_group_name = "ntier-dev"
location = "eastus"
network_range = [ "10.10.0.0/16" ]
