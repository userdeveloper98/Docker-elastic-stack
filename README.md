# Elastic Stack Docker Compose

This example of docker compose configuration will help you to start the elastic-stack chain with all apps running on a single machine under Docker.  
elk-docker chain:  `logfile -> Filebeat -> Logstash -> Elsticsearch <--> Kibana`  

#
    - Running the Elastic Stack on Docker
    - Installing the ELK Stack on Docker
    - ELK stack using Docker Compose
    - Running Kibana on Docker
    - Running a local kibana in a container    

## Start the stack
 - If you are on Windows, make sure you have at least 4Gb of RAM in `Docker Desktop -> Settings -> Resources -> Advanced -> Memory`
 - Make sure ports `9200` and `5601` are free on the host (or update `docker-compose.yml`)
 - Go to project root folder (where `docker-compose.yml` is)
 - Run: `docker-compose stop && docker-compose up`
 - Open: `http://localhost:5601` 
 
## Create index pattern
 - Go to `http://localhost:5601/app/kibana#/management/kibana/index_pattern`
 - Name the Index pattern `filebeat*`, press `next step`
 - Select  `@timestamp` for `Time Filter field name` field, press `Create index pattern`

## Check the logs
 - Go to `http://localhost:5601/app/kibana#/discover`
 - Select `Last year` in time filter.
 - You should see the logs from `test.log` file

## Project structure
 - root
    - workspace
        - conf # Filebeat and Logstash configuration files (check the documentation)
        - logs # folder which by default will be mounted to filebeat and monitored for changes. All `*.log` files.
    - `docker-compose.yml` # Docker compose file
    - `remove_and_create.bat` # Will remove elk_network, elk_data and containers.
    - `restart.bat` # Stop the containers and start again

### Default configuration:
- logfile -> Filebeat -> Logstash -> Elsticsearch <--> Kibana

### Alternative configurations:
- logfile -> Filebeat -> Elsticsearch <--> Kibana
- logfile -> Logstash -> Elsticsearch <--> Kibana


