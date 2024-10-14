## Local Execution instructions

* Configure AWS credentials in default profile for local setup

Pass following values to the `config.json` file

* ipam-pool-id
* regions as `eu-central-`
* vpc cidr block

Pass following values to the `state.tf` file

* bucket (to store statefile, it should be in `eu-central-1` region)
* region (as `eu-central-1`)
* key (the name of statefile in bucket)


Run following commands to test locally

```
terraform init

terraform validate

terraform plan -out plan.out

terraform apply plan.out
```

## Github Execution

Add following environment variables to Github actions pipeline to run

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION


Github action pipeline will trigger on every push in every branch and will create a plan  
When pushed into `main` branch, it will create a plan and execute it

## Additional information

* Right now, NACL allows all inbound and outbound traffic, you can update it in `modules/10-vpc/20-nacl.tf`
* Further routes can be added by uncommenting the `20-subnets/50-route-table-routes.tf`
