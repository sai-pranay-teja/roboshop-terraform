git:
	git pull

# dev-apply: git
# 	terraform init -backend-config env-dev/state.tfvars
# 	terraform apply -var-file=env-dev/main.tfvars -auto-approve

# dev-destroy:
# 	terraform destroy -var-file=env-dev/main.tfvars -auto-approve


# prod-apply: git
# 	terraform init -backend-config env-prod/state.tfvars
# 	terraform apply -var-file=env-prod/main.tfvars -auto-approve

# prod-destroy:
# 	terraform destroy -var-file=env-prod/main.tfvars -auto-approve


apply: git
	terraform init
	terraform apply -var-file=env-dev/main.tfvars -auto-approve

destroy:
	terraform destroy -var-file=env-dev/main.tfvars -auto-approve
