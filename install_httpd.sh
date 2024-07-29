
##!/bin/bash

#sudo su
##yum update -y
#yum install httpd -y
#systemctl start httpd
#systemctl enable httpd
#echo "<html><h1><p> Welcome to the testing of AWS load_balancer.<br> You are redirected to ${HOSTNAME} to see how the load balancer is sharing the traffic.</p></h1></html>" > /var/www/html/index.html


#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo bash -c 'echo "<html><body style=\"background-color: 47D34F;\"><h1><p> Welcome to Utrains the place to learn DevOps, Cloud, Linux!!.<br> This traffic is served from: <span style=\"color: purple;\">${HOSTNAME}</span> </p></h1></body></html>" > /var/www/html/index.html'