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
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUU2RENDQXRDZ0F3SUJBZ0lRQk1ZajJNV1NqVU5QY3EyYjV1YXZNakFOQmdrcWhraUc5dzBCQVFzRkFEQU4KTVFzd0NRWURWUVFERXdKallUQWdGdzB5TkRBeU1qTXhNRFV3TVRkYUdBOHlNRFUwTURJeU16RXhNREF4TjFvdwpEVEVMTUFrR0ExVUVBeE1DWTJFd2dnSWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUNEd0F3Z2dJS0FvSUNBUUMrCmtra2dYMnJQRmtPNzB3cTlxK3N6dVl2SnAzYkZHeGs3UmVnZkhpRXJMRjNCQ3pKTCt2emEraVlYckU4TjdsR0wKLzQyc2R4d2NPckhmNTJrelZBZzFoTUg5aEJKRWxPTE12QVkrbjBqTVh3ejJoa1VYVkIvbS8zR2k3VHZYSW02RQpCSHNDclZ6dGNKRHl1UU5MTkwrMGFCZmlibkFTNDhTcVR2YVl0NHJLYVRSYW1sUmFDV0MzVmd5MzJhU0xGWUhrCktrVEJKUUlwd0J4TEFPZGd0L2dIVHVLMlZ2K1UwcnhHTWx1Umd0MmdEV2dEdHJSanR1OEI2dmdZWEdDODUyVDYKT29pOUlnZDg1eng5Zi9LL1hOVDRscjFwOWVZMEt4WU0vY3ZEQzB5Y3JLZGkvZlF6TFZ1TGFGcXlWenI4YitXSgpzYmpmcFhSQmg3TmVnUTNUMDRQQUdtU0dNampZNkRDa3ZVL0UwSDFrZHB0MzJYeWR5WS94bEp3cHg3Uk4wa2JnCmEzYS9sLzkxOVlhVmRnWGFQd0J3cW42Z3FIaFJpbHFnVUhxOG9IQ1QyME1NUCtLY3BKK016UndGMlhuTjVlRjYKeFJ5emlWc2lveHRrTDV4TUNQbW9qOElJTXhNZWNKcDBtMUtUdFRvNi9HeE42Tlh6RG1lRzhXVTRlU2ZYRk0xNQo3RnZ6WWFrbUQ0bEthN0IvSlczMXhGOWRKVDFidlNtRjl3dDNDT01yMkV3a0ZCd3lOVDM2YnB1TElnRlZ4TUlaCkR2R2g0L3M0QmFHY2xxRGQ1dWUrdThaNXFTbU1GMjhUTEgzdzY4eGo0ZS9sRE12UUo4VC9hdzNvZmNPczdYOGoKTForU3NZalo2VU44TVN3VFZBMHVmblJ5RUo5RUZaVmlKSXdsamNNNGFRSURBUUFCbzBJd1FEQU9CZ05WSFE4QgpBZjhFQkFNQ0FxUXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVzOStnRWNGMmtXZnZsc3gyCmkwLzNuaURTN1RZd0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dJQkFLZy9YbEpIR0F1b3VHVlNnL0VaVjhXSSttTUEKVFZPMkhSM2RPR09oOXpYWHM2UFArcmYvTVliMk1rcVJNSFpMNzh4enFValNxamJBczVqbEp3U0ZNcENvc1hYYQpZUVNndGpaKzZIVWVqUTJYQkwxZW9TQWpEVXpyaEV5SW42MmU5VUE2NXVTaW0zWFc1OWhTM0cvZDlaOXQ2Wjc3Ck1PR1NoeEorTEJHWTd5NmNEb1BjaW5NdUh1MWRNMXFkYTE4MkhoQWUrTFZVQTdQQjNMZTVUMENvRU9udktON3MKcENldk1WZUpwSTRGUmowSTh1bFJ0Y1hjRk5sYm9Yb0pPUHFSd2xPdWF6d2VDRTFCRjBRZUlWR1hHQXNEUGt0awpwRGRUV1RrdXdTUE5WWmx6K3Z0eElpREJid1ZxRTc0ell6NWQyUXhZWkpKYUQ2YzhyVnRsN1ptY1JaQnQyRGVUCnZjQXRiY0RoYzNiS092RXJwZmErcE15c09pM1RhL29hZWFWdkp6NW9oQnUyaFdKdHN2a3dWUU05S3dGWndVMngKNFFzek50U1dtVGR6L1AzUHJlS3ZLcUJaTUN2MS8zNnhGL2ZvNkVOQk5zUnMrbUJSMno4eStTaXg5aHBueHhIbwpZK05keGZpVjducy9kODVQeWVwNFdRdXkwNW5RNWNpcEFNQS9ZMXROZzh5dWtPY3VpVWNjZVJSUC9WZXdWK2pnCllwMVQwQlBpc2lqYW9oOFhEV01DNTcvWS95QUZ5OFdYczN4MG5RS0puSnFQdE9hZFoxZDdwR1ZCMG1FdmRpTU4KVm9LR2ZlVFFvNXRkNitCSTcxa3kyQUhST3I3aVVCVVV5czIvLzlldzdvZzdXTThDZFFZenY5STJEbVVBLzRUcwpjNE5mcDJvQVlGTW9kaWU5Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    server: https://ems-ore86nza.privatelink.eastus.azmk8s.io:443
  name: aksdev
contexts:
- context:
    cluster: aksdev
    user: clusterUser_aksdev-rg_aksdev
  name: aksdev
current-context: aksdev
kind: Config
preferences: {}
users:
- name: clusterUser_aksdev-rg_aksdev
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - get-token
      - --environment
      - AzurePublicCloud
      - --server-id
      - 6dae42f8-4368-4678-94ff-3960e28e3630
      - --client-id
      - 80faf920-1908-4b52-b5ef-a8e7bedfc67a
      - --tenant-id
      - 3d219147-6204-4fec-92f6-fcf16f76d211
      - --login
      - devicecode
      command: kubelogin
      env: null
      installHint: '
 
        kubelogin is not installed which is required to connect to AAD enabled cluster.
 
 
        To learn more, please go to https://aka.ms/aks/kubelogin'
 
        EOT
    accept_untrusted_certs = true
    cluster_context        = "aksdev"
  }
}
 