# module "eks_blueprints_addons" {
#   source = "aws-ia/eks-blueprints-addons/aws"
#   version = "~> 1.0" #ensure to update this to the latest/desired version

#   cluster_name      = aws_eks_cluster.demo.name
#   cluster_endpoint  = aws_eks_cluster.demo.endpoint
#   cluster_version   = aws_eks_cluster.demo.version
#   oidc_provider_arn = aws_eks_cluster.demo.oidc_provider_arn

#   eks_addons = {
#     aws-ebs-csi-driver = {
#       most_recent = true
#     }
#     vpc-cni = {
#       most_recent = true
#     }
#     kube-proxy = {
#       most_recent = true
#     }
#   }
#   enable_aws_efs_csi_driver              = true
#   enable_aws_load_balancer_controller    = true
#   enable_karpenter                       = true
#   enable_kube_prometheus_stack           = true
# }




resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.demo.name
  addon_name   = "vpc-cni"
  
}

resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = aws_eks_cluster.demo.name
#   addon_name   = "ebs-csi-driver"
  addon_name   = "aws-ebs-csi-driver"
  service_account_role_arn = aws_iam_role.test_oidc_ebs.arn
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.demo.name
  addon_name   = "kube-proxy"
}

# resource "aws_eks_addon" "aws_load_balancer_controller" {
#   cluster_name = aws_eks_cluster.demo.name
#   addon_name   = "aws-load-balancer-controller"
# }

resource "aws_eks_addon" "efs_csi_driver" {
  cluster_name = aws_eks_cluster.demo.name
#   addon_name   = "efs-csi-driver"
    addon_name   = "aws-efs-csi-driver"
    service_account_role_arn = aws_iam_role.test_oidc_efs.arn
}
