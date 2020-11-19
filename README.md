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



To Provision used terraform script, Which is attached in this repositoy.
I have used amazon ami and t2.micro(free tier).

Step 1: 
 Create an IAM user and,. in this case i have given administrator acess to my user. (you can specify permission according to ur requirement).
 
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

Step3 :-

Attach an elastic Ip to assign a static Ip address. 
1. click on elastic ip address -> allocate ip address -> allocate
2. click on actions -> associate the EIP to the instance.



Step4:

Now, it's time to launch your instance and do deploy  your  application. I have used Mobaxterm in my case to connect to the instance. (putty is also available).

Our requirement is to launch application using docke compose and an database container too. So, we need to download it. 

commands to download:-

#yum update -y
-> sudo yum install docker

and start the services  and enable the services of the docker
->systemctl start docker
#systemctl enable docker

Now we need to install docker-compose in our system.
commands to install docker-compose in linux system:-

#sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#docker-compose --version

![image](https://user-images.githubusercontent.com/46579657/99657833-abb8d980-2a84-11eb-91b2-c00af511c843.png)

Step 5:-

Now we have to write a docker-compose file to launch  the databse instance and to launch an application.
So, I have to written the Dockerfile which wil copy the existing HTML code into the conatiner and docker-compose.yml file use this dDockerfile to build the container.

My Dockerfile looks like this ->

![image](https://user-images.githubusercontent.com/46579657/99658639-c93a7300-2a85-11eb-9722-433fed308af2.png)

and, here is my docker-compose file,

![image](https://user-images.githubusercontent.com/46579657/99659077-58e02180-2a86-11eb-95c9-4ad41141103a.png)


To build this execute,
#docker-compose up -d 

So, as you  can see that build is successfull and the the containers are running up.

![image](https://user-images.githubusercontent.com/46579657/99659429-defc6800-2a86-11eb-9aeb-43c500ff0ab0.png)

![image](https://user-images.githubusercontent.com/46579657/99659524-fb98a000-2a86-11eb-99e3-87790b496669.png)

Now we can launch the container and check whether  the application is working or not.

#docker run -dit -p 1523:80 --name os1 oodles_web

![image](https://user-images.githubusercontent.com/46579657/99660679-b4131380-2a88-11eb-959e-3dbc34a3663b.png)


go to the browser band type in the IP address with specified port number 

![image](https://user-images.githubusercontent.com/46579657/99661014-38659680-2a89-11eb-8a34-a26c922a727c.png)

So as you can see that my container is working and the website is also running, it's a sample html page, you can use your own code to deploy various applications accciording to your requirments.

We have succesfully deployed it. CHEERS.


  

























































































`
