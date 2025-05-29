# devops-project
👉 lets clone this repo by using below url
```sh
git clone https://github.com/vardhan1228/devops-project.git
```
👉 switch to cloned repo and terraform configuration files repo
```sh
cd src/main/resources
```
##  these all files consist of ec2 creation and cloneing the public git hub repo and deploying the appliaction through privisioners
## change the values in ## terraform.tfvars ## file 
## one more main procress is we need to generate the keys in local for connection ec2 by unsing provisioners 
## if you have alredy priavte key in your local just passs the priavte key path in provisoner connection block and commnet the key pair resource block 
-- change the key name according your environment
```sh
ssh-keygen -t rsa
```
-- by unsing above commnd generate keys in cmd
## after that change the public key and peiavte key path in ec2.tf  resource block and provisoner.tf connction block files
## one more main thing you nedd to pass your cloud credantiels in terraform working dircictroy by using aws configure 
## if your keys alredy configured just ignore aews configure
```sh
Install AWS CLI    ## if alredy installed igonre it 
Create IAM user with required policy
Generate access and secret keys
Run aws configure to set up credentials
aws configure
```
-- everthing is done just run the following commnds to build infra and all

```sh
terraform init
terraform plan
terraform apply
```
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
# created s3.tf for s3 bucket creation and bucket readonly access policy
# i am supertaed provisioners to superate file called as provioners.tf. iam writed two null resources one is for previous task and another one is for task two .
#  In this second provisioner i am cloned the private repo from git hub static files repo and placed that files into s3 bucket
## if your end change the priavte repo cloning url here  
# creted one more file iam.tf. In this file i am creted s3 full a accees permisiion policy and crated ec2 role 
# logs.sh file is for to move specific log files to s3 bucket
# logs.service file refers to trigger the shutdown behaviours
# change the git pat token  and s3 bucket name in terraform.tfvars 
#  and also change s3 bucket name in logs.sh
# in terraform.tfvars change to your git hub pat token
# and priavte repo url on the provisioner block
### change the terraform.tfvars file values according two your requirement  but take the os is amazon linux only because we have configured entire shell script to amazon linux only
##  if you are doing this assingnmnets facing any errors or stuck anywhwre feel free to reach out me 
          thank you
          srivardhan vallbahaneni

