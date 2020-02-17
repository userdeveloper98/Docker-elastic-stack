docker-compose down -v --rmi local  --remove-orphans
docker-compose build --pull --force-rm
docker-compose up