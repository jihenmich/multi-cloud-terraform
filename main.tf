provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jihens_instance" {
  ami             = "ami-099da3ad959447ffa"
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "ExampleInstance"
  }

  depends_on = [aws_security_group.allow_ssh]
}

# Debugging-Ausgabe hinzufügen
output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}

resource "azurerm_storage_account" "jihensStorage" {
  name                     = "examplejihen25"
  resource_group_name       = var.azure_resource_group
  location                 = var.azure_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "jihensContainer2502" {
  name                  = "example-container"
  storage_account_id    = azurerm_storage_account.jihensStorage.id
  container_access_type = "private"
}

output "ec2_public_ip" {
  value = aws_instance.jihens_instance.public_ip
}

output "azure_storage_account_name" {
  value = azurerm_storage_account.jihensStorage.name
}
