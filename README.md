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
-- if you want yo change the instance tpye chage it on ## variable.tf ## file 
## one more main procress is we need to generate the keys in local for connection ec2 by unsing provisioners 
```sh
ssh-keygen -t rsa
```
-- by unsing above commnd generate keys in cmd
## after that change the public key and peiavte key path in ec2.tf file
-- everthing is done just run the following commnds to build infra and all
## one more main thing you nedd to pass your cloud credantiels in terraform working dircictroy by using aws configure 
```sh
aws configure
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
##  if you are doing this assingnmnets facing any errors or stuck anywhwre feel free to reach out me 
          thank you
          srivardhan vallbahaneni

