### Before running Terraform, ensure:
* Terraform >= 1.5
* AWS CLI configured (aws configure)
* MongoDB Atlas account
* MongoDB Atlas API keys:
    * MONGODB_ATLAS_PUBLIC_KEY
    * MONGODB_ATLAS_PRIVATE_KEY
* Export Atlas credentials:
    * export MONGODB_ATLAS_PUBLIC_KEY=xxxx
    * export MONGODB_ATLAS_PRIVATE_KEY=yyyy


### Deployment Steps
* Select Environment
```
cd envs/dev
```
* Initialize Terraform
```
terraform init
```
* Review Plan
```
terraform plan
```
* Apply Infrastructure
```
terraform apply
```
Repeat the same steps for test and prod.

After Terraform completes:
```
npm run build
aws s3 sync build/ s3://mern-ui-dev
```


