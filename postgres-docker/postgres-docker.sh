docker build -t docker-postgres .
docker run --name docker-postgres -p 9876:9876 docker-postgres