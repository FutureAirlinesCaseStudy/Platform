#!/bin/bash
export DATE=`date +"%Y%m%d"`
echo "CREATING NETWORK SETUP ON AWS"
/home/ubuntu/pt-1/vpc.sh 2>&1 | tee /home/ubuntu/pt-1/vpc.log-"$DATE"
export nwsetupstatus=`echo $?`
if [ "$nwsetupstatus" -eq 0 ] 
then
	echo "CREATING NETWORK SETUP ON AWS COMPLETED SUCCESSFULLY"
else
	echo "CREATING NETWORK SETUP ON AWS FAILED, CHECK THE LOGS IN /home/ubuntu/pt-1/vpc.log-$DATE"
	exit 1
fi
echo "############################################################################"

echo "PROVISING EC2 INSTANCES, SETTING UP DOCKER SWARM CLUSTER AND ELK"
/home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/ec2-dockerswarm-elk.sh 2>&1 | tee /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/ec2-dockerswarm-elk.log-"$DATE"
export ec2dselkstatus=`echo $?`
if [ "$ec2dselkstatus" -eq 0 ] 
then
	echo "PROVISING EC2 INSTANCES, SETTING UP DOCKER SWARM CLUSTER AND ELK COMPLETED SUCCESSFULLY"
else
	echo "PROVISING EC2 INSTANCES, SETTING UP DOCKER SWARM CLUSTER AND ELK FAILED, CHECK THE LOGS IN /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/ec2-dockerswarm-elk.log-$DATE"
	exit 1
fi
echo "#############################################################################"

echo "DEPLOYING JENKINS MASTER ON DOCKER SWARM"
/home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/jenkins.sh 2>&1 | tee /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/jenkins-deployment.log-"$DATE"
export jenkinsdplystatus=`echo $?`
if [ "$jenkinsdplystatus" -eq 0 ]
then
	echo "DEPLOYING JENKINS MASTER ON DOCKER SWARM COMPLETED SUCCESSFULLY"
else
	echo "DEPLOYING JENKINS MASTER ON DOCKER SWARM FAILED, CHECK THE LOGS IN /home/ubuntu/pt-1/ec2-docker-swarm-prometheus-grafana-master/dockerswarm-elk-monitoring-automation/jenkins-deployment.log-$DATE"
	exit
fi
echo "#############################################################################"
