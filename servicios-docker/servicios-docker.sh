docker kill $(docker ps -aq)
docker rm $(docker ps -aq)
docker build -t mi-apache .

docker run -d -p 8081:80 -e VAR_ENTORNO="FRONTEND" -e VAR_PROYECTO="FRONTEND VUE JS" --name container_vuejs mi-apache
docker run -d -p 8082:80 -e VAR_ENTORNO="BACKEND" -e VAR_PROYECTO="BACKEND APP" --name container_backend_app mi-apache
docker run -d -p 8083:80 -e VAR_ENTORNO="BACKEND" -e VAR_PROYECTO="BACKEND AUTH" --name container_backend_auth mi-apache
docker run -d -p 8084:80 -e VAR_ENTORNO="BACKEND" -e VAR_PROYECTO="BACKEND REPORT" --name container_backend_report mi-apache