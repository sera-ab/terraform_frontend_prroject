# terraform_frontend_prroject

## Deploy a frontend web infrastructure 


Automate a front-end web infrastructure for example.com using Terraform.

▪ There should be a load balancer in front of the web servers

▪ There should be persistent storage for the web servers

▪ SSL should be terminated on the load balancer and utilize AWS issued certificates.

▪ Web front end should be highly available with health checks that remove failed nodes and automation to replace them without intervention

▪ Solution should support auto-scaling with a minimum to 2 nodes and maximum of 3 nodes


▪ The Terraform automation should be able to deploy and configure the load balancers with certificates and deploy web servers with persistent storage. 
The application should be deployed using GitHub actions.


▪ AMIs built with Packer or using a standard public Linux distribution

▪ Secrets in Terraform repo using SOPS.

▪ Secrets in infrastructure using AWS secrets manager

▪ Allow deployment of alternate environments (e.g., “dev” or “stage” for testing)


▪ Deployable to existing VPC to interface with existing infrastructure

DNS / Route53
