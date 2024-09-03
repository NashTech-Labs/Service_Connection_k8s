data "azuredevops_project" "project" {
  name = var.azure_devops_project_VV
}

data "azurerm_subscription" "current" {
  subscription_id = var.subscription_id_VV
}


resource "azuredevops_serviceendpoint_kubernetes" "example-kubeconfig" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = var.service_endpoint_name_VV
  apiserver_url         = var.apiserver_url_VV
  authorization_type    = "Kubeconfig"

  kubeconfig {
    kube_config            = <<EOT

        EOT
    accept_untrusted_certs = true
    cluster_context        = "name-of-aks"
  }
}
 