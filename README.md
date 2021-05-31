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

    
