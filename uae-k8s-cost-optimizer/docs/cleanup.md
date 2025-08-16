# Cleanup / Destroy
To avoid charges:
1) Delete EKS cluster:
   eksctl delete cluster -f cluster/cluster.yaml
2) Verify no stray resources (ELB, EBS, ENI) remain.
