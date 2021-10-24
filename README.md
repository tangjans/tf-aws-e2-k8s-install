# Introduction
This is an Infrastructure as Code (IaC) collection of Terraform scripts to bootstrap a Kubernetes cluster of one master and one worker node for lab work and testing. The nodes will be created on AWS EC2 instances (T2.Medium).

# Requirements
* AWS account
* AWS CLI installed
* Terraform CLI installed
* AWS IAM credentials with appropriate permissions created with ACCESS KEY and SECRET ACCESS KEY exported as environment variables e.g.:

````
$ export AWS_ACCESS_KEY_ID="AKIAXOUKCW2SN25QPM6X"
$ export AWS_SECRET_ACCESS_KEY="GgIsdRBehE3pZD2GVpuomry8WmkXUvJ77psAhZ70"
````