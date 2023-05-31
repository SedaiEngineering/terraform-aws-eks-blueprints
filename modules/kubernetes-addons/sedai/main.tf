
module "helm_addon" {
  source = "../helm-addon"

  helm_config = merge({
    name        = local.name
    description = "A Helm chart for Sedai"
    chart       = local.name
    version     = "1.21.32"
    repository  = "oci://public.ecr.aws/sedai_io/sedai-smart-agent-chart"
    namespace   = local.namespace
    values = [templatefile("${path.module}/values.yaml", {
      agentAccountId = local.agentAccountId
      tenantName = local.tenantName
      agentAccountName = local.agentAccountName 
      agentClusterName = local.agentClusterName
      agentEncryptionKey = local.agentEncryptionKey
      deploymentName = local.deploymentName
      deploymentNameSpace = local.deploymentNameSpace
      containerName = local.containerName
      serverAccessKey = local.serverAccessKey
      serverRestBaseUrl = local.serverRestBaseUrl
      serverWsBaseUrl = local.serverWsBaseUrl
      logFolder = local.logFolder
    })]
    },
    var.helm_config
  )

  # Blueprints
  addon_context = var.addon_context
}
