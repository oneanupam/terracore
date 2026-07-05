# terraform initialization recipe

init:
	terraform init

# terraform plan recipe

plan:
  terraform validate
	terraform fmt -recursive
  terraform plan

# terraform apply recipe

apply:
  terraform apply -auto-approve
