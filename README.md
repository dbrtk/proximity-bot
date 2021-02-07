# proximity-bot 


## These commands will run proximity-bot on a local machine:
First clone the source code, including submodules:
```
git clone --recurse-submodules https://github.com/dbrtk/proximity-bot.git
```
cd into the code repository:
```
cd proximity-bot
```
Use docker-compose to build and run the software:
```
docker-compose build
docker-compose up --scale rmxbotweb=5 --scale rmxgrep=7 --scale rmxbotcelery=5 --scale nlp=7 --scale scrasync=5 --scale rmxnmf=5
```

or in one command:
```
docker-compose up --build --scale rmxbotweb=5 --scale rmxgrep=7 --scale rmxbotcelery=5 --scale nlp=7 --scale scrasync=5 --scale rmxnmf=5
```
that's it. 

After these commands succeed and all services are running, the interface is available in the browser, under
## http://localhost

At this point, some basic load balancing with nginx is implemented on rmxbot (rmxbotweb) and rmxgrep (rmxgrepservice).

Docker and docker-compose are required to run the stack. Their installation is described under these links: 
https://docs.docker.com/install/;
https://docs.docker.com/compose/install/.

