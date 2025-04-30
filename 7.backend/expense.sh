# What ansible do here;

#1. we created a backend like instance 
#2. with ansible , we install everything ie. new version of application
#3. after that we get launch template from that and trigger ASG

# Also note that , we are updating ASG without checking whether the new version is doing well or not ; Blindly updating ASG without verifying app = Instant Disaster in Production. 🚨

#we should check manually everything and if its good then only you delete the instance and trigger ASG

#!/bin/bash

component=$1
environment=$2
echo "Component: $component, Environment: $environment"
dnf install ansible -y
ansible-pull -i localhost, -U https://github.com/raghuatharva/expense-ansible-roles-tf.git main.yaml -e component=$component -e environment=$environment