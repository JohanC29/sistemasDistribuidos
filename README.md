# sistemasDistribuidos

## Diagrama de arquitectura

![Diagrama de arquitectura](./diagrama/09-DiagramaArquitectura02.png)

## Componentes del diagrama de arquitectura

1. Firewalls.
2. Nginx load balancer.
3. Imagen con vue js para el front.
4. Backend App.
5. Backend Report.
6. Backend Authenticacion.
7. Base de datos postgress

Asigancion de imagenes a los componentes:

|Aplicacion|imagen|
|---|---|
|Firewalls|api-firewall:latest|
|Nginx load balancer|johanc29/nginx-agenda-courier:latest|
|Imagen con vue js para el front|johanc29/sistemas-distribuidos:latest|
|Backend App|johanc29/sistemas-distribuidos:latest|
|Backend Report|johanc29/sistemas-distribuidos:latest|
|Backend Authenticacion|johanc29/sistemas-distribuidos:latest|
|Base de datos postgress|johanc29/docker-postgres:latest|

## Configuracion archivo .tf

main.tf

## Instalacion y aplicacion

```sh
terraform validate

terraform apply
```

### Referencias

1. [docker provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#nestedblock--volumes)
