git:
	git pull

# s3-apply: git
# 	cd /home/pranay/roboshop/roboshop-terraform/s3; terraform init; \
# 	terraform apply -auto-approve

# parameters-apply: s3-apply
# 	cd /home/pranay/roboshop/roboshop-terraform/parameters; terraform init -backend-config env/state.tfvars; \
# 	terraform apply -var-file=env/main.tfvars -auto-approve

# apply: parameters-apply
# 	cd /home/pranay/roboshop/roboshop-terraform; terraform init; \
# 	terraform apply -var-file=env-practise/main.tfvars -auto-approve


# parameters-destroy:
# 	cd /home/pranay/roboshop/roboshop-terraform/parameters; terraform destroy -var-file=env/main.tfvars -auto-approve

# destroy: parameters-destroy
# 	cd /home/pranay/roboshop/roboshop-terraform; terraform destroy -var-file=env-practise/main.tfvars -auto-approve

# s3-destroy: destroy
# 	cd /home/pranay/roboshop/roboshop-terraform/s3; terraform destroy -auto-approve


# instances-apply: git
# 	terraform init
# 	terraform apply -var-file=env-practise/main.tfvars -auto-approve


# instances-destroy:
# 	terraform destroy -var-file=env-practise/main.tfvars -auto-approve


s3-apply: git
	cd /home/pranay/roboshop/roboshop-terraform/s3; terraform init; \
	terraform apply -auto-approve

instances-apply: s3-apply
	rm -rf .terraform* terraform*
	terraform init -backend-config env-practise/state.tfvars
	terraform apply -var-file=env-practise/main.tfvars -auto-approve

instances-destroy:
	terraform destroy -var-file=env-practise/main.tfvars -auto-approve


s3-destroy: instances-destroy
	cd /home/pranay/roboshop/roboshop-terraform/s3; terraform destroy -auto-approve

# instances-apply: git
# 	rm -rf .terraform* terraform*
# 	terraform init
# 	terraform apply -var-file=env-practise/main.tfvars -auto-approve


# instances-destroy:
# 	terraform destroy -var-file=env-practise/main.tfvars -auto-approve
