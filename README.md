## Description

Here, In this template we are going to create the service connection of kubernetes type for the authorization

---

#### Pre-requisite

* AZ Account
* Azure CLI
* ADO Account

---

### Steps:-
1. Login into AZ account using `az login` or `az login --tenant <TENANT-ID>`
2. Login into the Azure using the Service Principal the Service Principal like `az service principal -u <client-id> -p <client-password> -t <tenant-ID>`.

---
 
## Configuration

The following table lists the configurable parameters for the module with their default values.

| Parameters                   | Description                                        | Default  | Type    | Required |
|------------------------------|----------------------------------------------------|----------|---------|----------|
| adotoken_VV                  | Personal Access Token to create Service Connection |          | string  | Yes      |  
| organization_service_url_VV  | Organisation Service URL                           |          | string  | Yes      |  
| azure_devops_project_VV      | Name of Azure DevOps Project                       |          | string  | Yes      |
| subscription_id_VV           | ID of Subscription                                 |          | string  | Yes      |
| service_endpoint_name_VV     | name of svc endpoint                               |          | string  | Yes      |
| apiserver_url_VV             | aks server url                                     |          | string  | Yes      |
| resourcegroup_id_VV          | resource group id                                  |          | string  | Yes      |
| cluster_name_VV              | name of aks cluster name                           |          | string  | Yes      |
| 
---
