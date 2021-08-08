#! /bin/bash
#MAINTAINER Eric
#THIS SCRIPT INSTALL JAVA AND JENKINS ON CENTOS AND UBUNTU


echo " checking the linux distribution"
LINUX=$(cat /etc/os-release |grep PRETTY_NAME | awk -F '"' '{print $2}' | awk  '{print $1}')

echo " installing JAVA"

if
        [[ ${LINUX} == Ubuntu ]]
then
        echo " your are using a $LINUX distribution "

sudo apt update  -y
sudo apt search openjdk
sudo apt install openjdk-11-jdk -y
java -version

elif
                [[ ${LINUX} == CentOS ]] || [[ ${LINUX} == Amazon ]]
then
        echo " your are using a $LINUX distribution "

sudo yum  update -y

else
        echo " your distribution is nither Ubuntu nor Centos"
fi


###########################################################################################################################
echo " installing jenkins"




echo " checking the linux distribution"
LINUX=$(cat /etc/os-release |grep PRETTY_NAME | awk -F '"' '{print $2}' | awk  '{print $1}')

echo " installing JAVA"

if
        [[ ${LINUX} == Ubuntu ]]
then
        echo " your are using a $LINUX distribution "

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update  -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins

elif
                [[ ${LINUX} == Amazon ]] 
then
        echo " your are using a $LINUX distribution "

sudo yum  update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo  https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-1.8.0  -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins


elif


[[ ${LINUX} == CentOS ]]
then
        echo " your are using a $LINUX distribution "

sudo yum  update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo  https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-11-openjdk-devel  -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins


        echo " your distribution is nither Ubuntu nor Centos"
fi


