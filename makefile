
git:
	git pull

s3-apply: git
	cd /home/pranay/roboshop/roboshop-terraform/s3/
	make apply

parameters-apply: s3-apply
	cd /home/pranay/roboshop/roboshop-terraform/parameters/
	make apply

apply: parameters-apply
	cd /home/pranay/roboshop/roboshop-terraform/
	terraform init
	terraform apply -var-file=env-practise/main.tfvars -auto-approve


parameters-destroy:
	cd /home/pranay/roboshop/roboshop-terraform/parameters/
	make destroy

destroy: parameters-destroy
	terraform destroy -var-file=env-practise/main.tfvars -auto-approve

s3-destroy: destroy
	cd /home/pranay/roboshop/roboshop-terraform/s3/
	make destroy