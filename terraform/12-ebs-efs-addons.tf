resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "vpc-cni"
  
}

resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = aws_eks_cluster.cluster.name
#   addon_name   = "ebs-csi-driver"
#   addon_version = "v1.11.4-eksbuild.1"
  addon_name   = "aws-ebs-csi-driver"
  service_account_role_arn = aws_iam_role.test_oidc_ebs.arn
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "kube-proxy"
}

resource "aws_eks_addon" "efs_csi_driver" {
  cluster_name = aws_eks_cluster.cluster.name
#   addon_name   = "efs-csi-driver"
    addon_name   = "aws-efs-csi-driver"
    service_account_role_arn = aws_iam_role.test_oidc_efs.arn
}