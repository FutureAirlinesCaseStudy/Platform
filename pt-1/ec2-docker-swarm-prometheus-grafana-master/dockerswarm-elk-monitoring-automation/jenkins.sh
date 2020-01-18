cd /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation
ansible-playbook -i elk/hosts jenkins.yml --key-file="automation.pem"
