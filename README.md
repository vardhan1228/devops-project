# devops-project
👉 lets clone this repo  
👉 switch to cloned repo and terraform configuration files path
```sh
cd src/main/resources
```
- `vpc.tf`: It defines creation of vpc and subnets and security groups 
- `ec2.tf`:Defines resources for EC2 instances, IAM roles, policies, and security groups.
- `iam.tf`: Defines resources for iam role for ece and s3 full access policy
- `provider.tf`: defines cloud provider and resources applied to the region
- `output.tf`: Outputs key information about the deployed EC2 instance, such as its public IP.
- `provisioners.tf`: It defines after creting the ec2 insatnce with the help of provisioners terraform will connect and apply the commnds such as git and nodejs installation,and public repo cloning and clone the priavte static website repo and push that static website into s3 bucket
- `s3.tf` : it defines s3 bucket creation and enabling the public acces and aslo adding the bucket policy to readonly access for the objects,and configured the life cycle rules to to delete the ec2 uploaded logs after 7 days 
- `variable.tf` : Define what values your Terraform code expects.Keep your configuration clean and modular.
- `terraform.tfvars` :it is  used in Terraform to assign values to input variables defined in variables.tf. and change the values here only
### change the terraform.tfvars file values according to your requirement  but take the os is amazon linux only because we have configured entire shell script to amazon linux only
-  these all files consist of ec2 creation and cloneing the public git hub repo and deploying the appliaction through privisioners
- change the values in ## terraform.tfvars ## file 
- one more main procress is we need to generate the keys in local for connection ec2 by using provisioners 
- if you have alredy priavte key in your local just passs the priavte key path in provisoner connection block and commnet the key pair resource block 
- change the key name according your environment
```sh
ssh-keygen -t rsa
```
- after generating the keyes place that path in terrafom.tfvars public,priavte key names
- by unsing above commnd generate keys in cmd or if you have alredy existing keys plese use it 
## after that change the public key and private key path in terraform.tfvars  
- one more main thing you nedd to pass your cloud credentails in terraform working dircictroy by using aws configure 
## if your keys alredy configured just ignore aews configure
- or if you need to generate and configure it 
- first you need to install aws cli 
```sh
Install AWS CLI    ## if alredy installed igonre it 
Create IAM user with required policy of ec2,s3,iam,vpc creation permisions i have created ** user-policy.json ** file for user polycy copy this json file and create the policy accoring to these policy this user only able to do these two tasks only
** this file will be tere on Deevops-project dirictory only **
Generate access and secret keys
Run aws configure to set up credentials
aws configure
```
### after that change the public repo name and user name of git in terraform.tfvars

## conclusion 
-- by unsing above configuration files i am done below tasks 
```sh
 1. Spins up an EC2 instance of a specific type
 2. Installs dependencies (Java, Git, etc.)
 3. Clones repo & deploys app from GitHub
 4. Tests if app is reachable via port 80
 5. Stops the instance after a set time (for cost saving)
```

## Devops asignment 2
- created s3.tf for s3 bucket creation and bucket readonly access policy
# 
- i am superated provisioners to superate file called as provioners.tf. iam writed two null resources one is for previous task and another one is for task two .
- In this second provisioner i am cloned the private repo from git hub static files repo and placed that files into s3 bucket
### after that change the priavte repo name and user name of git in terraform.tfvars
- creted one more file iam.tf. In this file i am creted s3 full accees permisiion policy and crated ec2 role 
- logs.sh file is for to move specific log files to s3 bucket
- logs.service file refers to trigger the shutdown behaviours
- change the git pat token  and s3 bucket name in terraform.tfvars 
### And also change s3 bucket name in logs.sh
### change the terraform.tfvars file values according to your requirement  but take the os is amazon linux only because we have configured entire shell script to amazon linux only

- everthing is done just run the following commnds to build infra and all

```sh
terraform init
terraform plan
terraform apply
```
-  if you are doing this assingnmnets facing any errors or stuck anywhwre feel free to reach out me 
          thank you
          srivardhan vallbahaneni

