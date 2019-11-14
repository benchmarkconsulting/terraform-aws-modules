resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "kwdevop-eks-role"
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "kwdevop-eks-role"
}
resource "aws_eks_cluster" "default" {
 name               = var.cluster_name
 version            = var.version
 role_arn           = aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy.role
 vpc_id             = aws_vpc.main.id
 vpc_config {
    subnet_ids = var.subnet_ids
  }
}
