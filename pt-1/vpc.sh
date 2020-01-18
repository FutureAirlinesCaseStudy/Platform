cd /home/ubuntu/pt-1/vpc
terraform init -input=false 
terraform plan -out=tfplan -input=false 
terraform apply -input=false tfplan
sleep 60s
sed -e "s/\${hv-public-1}/`cat terraform.tfstate |jq '.resources[14].instances[0].attributes.id' | sed 's/"//g'`/" /home/ubuntu/pt-1/vpc/test > /home/ubuntu/pt-1/vpc/test1

sed -e "s/\${hv-public-2}/`cat terraform.tfstate |jq '.resources[15].instances[0].attributes.id' | sed 's/"//g'`/" /home/ubuntu/pt-1/vpc/test1 > /home/ubuntu/pt-1/vpc/test2

sed -e "s/\${hv-public-3}/`cat terraform.tfstate |jq '.resources[16].instances[0].attributes.id'  | sed 's/"//g'`/" /home/ubuntu/pt-1/vpc/test2 > /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/ec2-provision/tasks/main.yml



