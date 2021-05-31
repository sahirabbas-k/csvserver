# The csvserver Solution

## PART I

1. Run the container image infracloudio/csvserver:latest in background and check if it's running.
   
   ```docker run --name csvsrv -d  infracloudio/csvserver:latest```

   Check the status of the container. If not running check the logs as well.
   
   ```docker ps -a csvsrv```

   ```docker logs csvsrv```
     
     Log output:

     ```2021/05/31 15:40:13 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory```

2. Write a bash script gencsv.sh to generate a file named inputFile whose content looks like:

    ```
       0, 234
       1, 98
       2, 34
    ```
    The script is available in the solution directory. 
    
    To execute the script run the below command: 
    
    ``` ./gencsv.sh > inputFile```

    It will create an output file named inputFile with some pre-defined values.

    If you want to append more values with the predefined values execute the script by passing arguments. 

    For Example: 

    ```./gencsv.sh 100 200 300```

3. Attach the bash script output file to the docker container as volume and run the docker container again to resolve the issue. 
   
   ```docker run --name csvsrv -d -v "$(pwd)"/inputFile:/csvserver/inputdata infracloudio/csvserver:latest```

   Identify the application port. 

   ```docker exec -it csvsrv netstat -tulnp```

      In this case, application is listening on port 9300

      Once the port is identified stop and delete the container

      ``` 
         docker stop csvsrv
         docker rm csvsrv
      ```
   Bind the container port to the host to access the application in the browser

   ```docker run --name csvsrv -d -v "$(pwd)"/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest```

   Repeat the stop and delete operation and pass the env to the container to get the Orange color header.

   ```docker run --name csvsrv -d -e CSVSERVER_BORDER=Orange -v "$(pwd)"/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest```   

##PART II

1. Repeat the stop and delete operation
2. Create a docker-compose.yaml file.
 ```
 version: '3'
services:
  csvsrv:
    image: infracloudio/csvserver:latest
    volumes:
    - type: bind
      source: ./inputFile
      target: /csvserver/inputdata
      read_only: true
    ports:
    - "9393:9300"
    environment:
    - CSVSERVER_BORDER=Orange
  ```
3. Run the application with docker-compose up.
   
   ``` docker-compose up -d``` 
