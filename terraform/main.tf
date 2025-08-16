module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = "uae-cost-opt"
  cluster_version = "1.28"
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # ADD THESE TWO LINES
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  cloudwatch_log_group_retention_in_days = 7

  eks_managed_node_groups = {
    spot_nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 1
      instance_types = ["t3.medium", "t3.large", "m5.large", "m5.xlarge"]
      capacity_type  = "ON_DEMAND"  # TEMPORARY - change to SPOT later
      
      update_config = {
        max_unavailable_percentage = 50
      }
      
      # ADD THESE NEW PARAMETERS
      ami_type       = "AL2_x86_64"
      disk_size      = 20
      enable_bootstrap_user_data = true
      bootstrap_extra_args = "--enable-docker-bridge true"
      
      # MODIFY THIS SECTION (add SSM policy)
      iam_role_additional_policies = {
        ecr = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        ssm = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  tags = {
    Project = "uae-k8s-cost-optimizer"
  }
}
