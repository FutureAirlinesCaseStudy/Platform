cd /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation
ansible-playbook ec2.yml
ansible-playbook -i hosts ansible-dockerswarm/playbook.yml --key-file="automation.pem"
ansible-playbook -i elk/hosts elk.yml --key-file="automation.pem"
ansible-playbook -i hosts filebeat.yml --key-file="automation.pem"
