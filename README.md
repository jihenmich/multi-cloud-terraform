# Multi-Cloud Deployment mit Terraform (AWS & Azure)

Dieses Repository enthält Terraform-Code zur Bereitstellung einer Infrastruktur auf **AWS** und **Azure**. Es erstellt eine EC2-Instanz auf AWS und einen Storage Account auf Azure.

## 📌 Voraussetzungen

Stelle sicher, dass du folgende Tools installiert hast:  
- [Terraform](https://developer.hashicorp.com/terraform/downloads)  
- [AWS CLI](https://aws.amazon.com/de/cli/)  
- [Azure CLI](https://learn.microsoft.com/de-de/cli/azure/install-azure-cli)  
- Ein AWS- und Azure-Konto  

---

## 🚀 Einrichtung & Deployment

### 1️⃣ Repository klonen  
```sh
git clone https://github.com/jihenmich/multi-cloud-terraform.git
cd multi-cloud-terraform
```

2️⃣ AWS und Azure konfigurieren
AWS-Zugangsdaten einrichten:
```sh
aws configure
```
Azure-Zugangsdaten einrichten:
```sh
az login
az account set --subscription "<dein-abonnement-name>"
```
3️⃣ Terraform-Variablen definieren
Erstelle die Datei terraform.tfvars mit deinen Regionen:

```sh
cat <<EOF > terraform.tfvars
aws_region   = "eu-central-1"  # Ändere dies ggf. auf deine bevorzugte Region
azure_region = "Germany West Central"  # Passe die Azure-Region entsprechend an
EOF
```
4️⃣ Terraform initialisieren
```sh
terraform init
```
5️⃣ Terraform-Plan prüfen
```sh
terraform plan
```
6️⃣ Infrastruktur bereitstellen
```sh
terraform apply -auto-approve
```
🛑 Infrastruktur löschen
Falls du die Ressourcen entfernen möchtest, führe aus:
```sh
terraform destroy -auto-approve
```
