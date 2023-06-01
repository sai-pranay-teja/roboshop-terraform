git:
	git pull

apply: git
	terraform init -backend-config env/state.tfvars
	terraform apply -var-file=env/main.tfvars -auto-approve

destroy:
	terraform destroy -var-file=env/main.tfvars -auto-approve