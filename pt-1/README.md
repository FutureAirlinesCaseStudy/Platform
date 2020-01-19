# Getting Started

### Reference Documentation

By executing master.sh, below full list of actions pack will be executed.
1. CREATING NETWORK SETUP ON AWS AS SUCH: 1.VPC 2.SUBNETS 3.ROUTE TABLES 4.IGW 5.NAT 6.ELASTIC-IP 7.ACL 8.SG 
2. PROVISING EC2 INSTANCES: 3 T2-MEDIUM INSTANCES
3. SETTING UP DOCKER SWARM CLUSTER: 1 MANAGER, 2 WORKERS 
4. SETTING UP ELK LOGGING and MONITERING
5. DEPLOYING JENKINS MASTER ON DOCKER SWARM  

### Requirements
1. AWS Account
2. EC2 (T2 MICRO) Instance on Default VPC, as Automation Server with below Software. 
  1. Terraform
  2. Ansible
  3. AWS CLI
  4. JQ
3. Create and Attach AWS IAM Admin Role to Automation Server.   
 
