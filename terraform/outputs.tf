output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

# Corrected outputs for node group IAM role
output "node_group_role_arn" {
  value = module.eks.eks_managed_node_groups["spot_nodes"].iam_role_arn
}

output "node_group_role_name" {
  value = module.eks.eks_managed_node_groups["spot_nodes"].iam_role_name
}

# Security group output (if needed)
output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}
