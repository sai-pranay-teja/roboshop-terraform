git:
	git pull

apply: git
	terraform init
	terraform apply -var-file=env-dev/main.tfvars -auto-approve

destroy:
	terraform destroy -var-file=env-dev/main.tfvars -auto-approve