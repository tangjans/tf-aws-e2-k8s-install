# Introduction
This is an Infrastructure as Code (IaC) collection of Terraform scripts to bootstrap a Kubernetes cluster of one master and one worker node for lab work and testing. The nodes will be created on AWS EC2 instances (t2.medium).

# Requirements
* Cloned repo on local machine
* AWS account
* AWS CLI installed locally
* Terraform CLI installed locally
* kubectl installed locally
* AWS IAM credentials with appropriate permissions created with ACCESS KEY and SECRET ACCESS KEY exported as environment variables e.g.:
````
$ export AWS_ACCESS_KEY_ID="AKIAXOUKCW2SN25QPM6X"
$ export AWS_SECRET_ACCESS_KEY="GgIsdRBehE3pZD2GVpuomry8WmkXUvJ77psAhZ70"
````
* Terraform commands run in this sequence
````
$ terraform init
$ terraform plan
$ terraform apply
````
* After the "terraform apply" command, you'll need to respond "yes" to ssh connections to both your master and worker nodes.
* Definition of Done - Post successful resource creation on AWS, run "kubectl --kubeconfig kubeconfig get nodes" locally and see both the Master and Worker nodes live:
````
$ kubectl --kubeconfig kubeconfig get nodes
NAME            STATUS   ROLES                  AGE     VERSION
ip-10-0-0-138   Ready    <none>                 90s     v1.22.1
ip-10-0-0-22    Ready    control-plane,master   2m42s   v1.22.1
````

