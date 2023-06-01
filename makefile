
git:
	git pull

s3-apply: git
	cd /home/pranay/roboshop/roboshop-terraform/s3/
	make apply

parameters-apply: git
	cd /home/pranay/roboshop/roboshop-terraform/parameters/
	make apply

apply: git
	cd /home/pranay/roboshop/roboshop-terraform/
	terraform init
	terraform apply -var-file=env-practise/main.tfvars -auto-approve


parameters-destroy:
	cd /home/pranay/roboshop/roboshop-terraform/parameters/
	make destroy

destroy: 
	terraform destroy -var-file=env-practise/main.tfvars -auto-approve

s3-destroy:
	cd /home/pranay/roboshop/roboshop-terraform/s3/
	make destroy