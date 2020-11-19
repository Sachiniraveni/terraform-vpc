<h2> TASK </h2>

Deploy Basic sample application using docker compose.(Can be java, nodejs, php or python etc..)</p>
-Also Run a Database container using Docker-compose(MySQL or mongo).</p>
-Mount root volume for those containers to host (bind mount)</p>
-Host this setup on AWS EC2 instance.(You can create your AWS free tier account)</p>
-Launch this instance in the new VPC rather than default VPC (Optional)</p>
-Create new user on the same EC2 server</p>
-Enable ssh key based authentication for new user with the new ssh key</p>
-Open only port 80 , 443 and the DB port for all. All other ports should not be accessible</p>
-Attach the elastic IP on the EC2 instance.</p>

-----------------------------------

To Provision I have used terraform script, Which is attached in this repositoy.
I have used amazon ami and t2.micro(free tier).

Step 1: 
 Create an IAM user and,. You can specify permission according to ur requirement
 
 This IAM i will specify in my terraform scrip.

Step 2:-

So, I have executed the terraform script which basically creates the ec2 instances, vpc and subnets, internte gateway, route table.

a). initialize the terraform so it will download all the neccessary files according to your script.
-> terraform init

b) now we to see what are we going to deploy so for that run
-> terraform plan

c) deploy it
-> terraform apply -auto-approve

Step 2:-
After deploying the  applications attach the IAM role to ur ec2 instance by  selecting the ec2 instance -> click on the actions -> security -> modify IAM role, and add the IAM role.

Now,  click on the instance id and click on the security -> security group.
Edit the security group and add  DB port for all. We have already opened the port for 80 and 443 using terraform script.

TO open the port for db instance for all choose Source(Anywhere)

You can also perform all the task manually if you don't want to write the terraform script.

Step3 :-

Attach an elastic Ip to assign a static Ip address. 
1. click on elastic ip address -> allocate ip address -> allocate
2. click on actions -> associate the EIP to the instance.





Step4:

Now, it's time to launch your instance and do deploy  your  application. I have used Mobaxterm in my case to connect to the instance. (putty is also available).

Add a new user to the EC2 Linux instance

1.    Connect to your Linux instance using SSH.

2.    Use the adduser command to add a new user account to an EC2 instance. The following example creates an associated group, home directory, and an entry in the /etc/passwd file of the instance:
$ sudo adduser new_user

3 . add a password
$sudo passwd username



Execute,
$sudo  ssh-keygen
in order to create a new ssh-key.

$ sudo cd username/.ssh/id_rsa

7.    Use the chmod command to change the .ssh/id_rsa file permissions to 600. Changing the file permissions restricts read or write access to the new_user.
$ sudo chmod 600 .ssh/id_rsa



Our requirement is to launch application using docker compose and an database container too. So, we need to download it. 

commands to download:-

#sudo yum update -y
#sudo yum install docker

and start the services  and enable the services of the docker
->sudo systemctl start docker
#sudo systemctl enable docker

Now we need to install docker-compose in our system.
commands to install docker-compose in linux system:-

#sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#sudo docker-compose --version

![image](https://user-images.githubusercontent.com/46579657/99673430-c6964880-2a9a-11eb-88a9-66365526413e.png)

Step 5:-

Now we have to write a docker-compose file to launch  the databse instance and to launch an application.
So, I have to written the Dockerfile which wil copy the existing HTML code into the conatiner and docker-compose.yml file use this dDockerfile to build the container.

My Dockerfile looks like this ->

![image](https://user-images.githubusercontent.com/46579657/99673880-4ae8cb80-2a9b-11eb-9b21-7ff5b98dc915.png)

and, here is my docker-compose file,

![image](https://user-images.githubusercontent.com/46579657/99674117-9c915600-2a9b-11eb-9fad-a08cbab3a270.png)

To build this execute,
-> sudo docker-compose up -d 

So, as you  can see that build is successfull and the the containers are running up.

![image](https://user-images.githubusercontent.com/46579657/99674852-92bc2280-2a9c-11eb-8462-01bf6f55e2fc.png)

![image](https://user-images.githubusercontent.com/46579657/99674913-a2d40200-2a9c-11eb-92ac-46101c098b98.png)


We have succesfully deployed it. CHEERS.


  

























































































`
