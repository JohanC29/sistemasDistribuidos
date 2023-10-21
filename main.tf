terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_network" {
  name = "app_network"
}

resource "docker_image" "image_firewall" {
  name = "api-firewall:latest"
}

resource "docker_container" "container_firewall" {
  name  = "firewall_container"
  image = docker_image.image_firewall.image_id
  
  restart = "on-failure"

  env = [
    "APIFW_URL=http://0.0.0.0:8080",
    "APIFW_API_SPECS=/opt/resources/httpbin.json",
    "APIFW_SERVER_URL=http://backend:80",
    "APIFW_SERVER_MAX_CONNS_PER_HOST=512",
    "APIFW_SERVER_READ_TIMEOUT=5s",
    "APIFW_SERVER_WRITE_TIMEOUT=5s",
    "APIFW_SERVER_DIAL_TIMEOUT=200ms",
    "APIFW_REQUEST_VALIDATION=BLOCK",
    "APIFW_RESPONSE_VALIDATION=BLOCK",
    "APIFW_DENYLIST_TOKENS_FILE=/opt/resources/tokens.denylist.db",
    "APIFW_DENYLIST_TOKENS_COOKIE_NAME=test",
    "APIFW_DENYLIST_TOKENS_HEADER_NAME=",
    "APIFW_DENYLIST_TOKENS_TRIM_BEARER_PREFIX=true"
  ]

  ports {
    internal = 8080
    external = 8080
  }

  volumes {
    container_path  = "/opt/resources"
    host_path      = "/volumes/api-firewall"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
  
}

resource "docker_image" "image_nginx" {
  name = "nginx:latest"
}

resource "docker_container" "container_nginx" {
  name  = "nginx_container"
  image = docker_image.image_nginx.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 80
  }
}

resource "docker_container" "container_vuejs" {
  name  = "vuejs_container"
  image = docker_image.image_nginx.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 81
  }
}

resource "docker_image" "image_backend_app" {
  name = "johanc29/docker-mitocode-microservice:28"
}

resource "docker_container" "container_backend_app" {
  name  = "backend_app_container"
  image = docker_image.image_backend_app.image_id

  ports {
    internal = 9373
    external = 8081
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_container" "container_backend_report" {
  name  = "backend_report_container"
  image = docker_image.image_backend_app.image_id

  ports {
    internal = 9373
    external = 8082
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_container" "container_backend_auth" {
  name  = "backend_auth_container"
  image = docker_image.image_backend_app.image_id

  ports {
    internal = 9373
    external = 8083
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_image" "image_postgres" {
  name = "postgres:latest"
}

resource "docker_container" "container_postgres" {
  name  = "postgres_container"
  image = docker_image.image_postgres.image_id

  env = [
    "POSTGRES_PASSWORD=mysecretpassword"
  ]

  ports {
    internal = 8080
    external = 1521
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}