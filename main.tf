
# IMAGES

module "seafile_mariadb_docker_image" {
    source       = "git::https://github.com/kzl86/tf-docker_image.git?ref=v1.0.0"
    name         = var.seafile_mariadb_docker_image
    keep_locally = var.seafile_mariadb_keep_locally
}

module "seafile_memcached_docker_image" {
    source       = "git::https://github.com/kzl86/tf-docker_image.git?ref=v1.0.0"
    name         = var.seafile_memcached_docker_image
    keep_locally = var.seafile_memcached_keep_locally
}

module "seafile_docker_image" {
    source       = "git::https://github.com/kzl86/tf-docker_image.git?ref=v1.0.0"
    name         = var.seafile_docker_image
    keep_locally = var.seafile_keep_locally
}

# NETWORK

module "seafile_net" {
    source = "git::https://github.com/kzl86/tf-docker_network.git?ref=v1.0.0"
    
    name   = var.seafile_docker_network_name
    driver = "bridge"
}

# CONTAINERS

module "seafile_mariadb_docker_container" {
    source  = "git::https://github.com/kzl86/tf-docker_container.git?ref=v1.1.0"
    name    = var.seafile_mariadb_container_name
    image   = module.seafile_mariadb_docker_image.latest
    restart = "unless-stopped"

    env =  var.seafile_mariadb_environment != null ? var.seafile_mariadb_environment : [
      "MYSQL_ROOT_PASSWORD=db_dev",
      "MYSQL_LOG_CONSOLE=true"
    ]

    mounts = [{
            "target" = "/var/lib/mysql"
            "source" = "${var.seafile_mariadb_data}"
            "type"   = "bind"
        }]

    networks_advanced = [{ 
        "name"    = module.seafile_net.name
        "aliases" = ["db"]
    }]
}

module "seafile_memcached_docker_container" {
    source  = "git::https://github.com/kzl86/tf-docker_container.git?ref=v1.1.0"
    name    = var.seafile_memcached_container_name
    image   = module.seafile_memcached_docker_image.latest
    restart = "unless-stopped"

    entrypoint = [
        "memcached", "-m", "256"
    ]

    networks_advanced = [{ 
        "name"    = module.seafile_net.name
        "aliases" = ["memcached"]
    }]
}

module "seafile_docker_container" {
    source  = "git::https://github.com/kzl86/tf-docker_container.git?ref=v1.1.0"
    name    = var.seafile_container_name
    image   = module.seafile_docker_image.latest
    restart = "unless-stopped"

    env = var.seafile_environment != null ? var.seafile_environment : [
        "DB_HOST=db",
        "DB_ROOT_PASSWD=db_dev",
        "TIME_ZONE=Europe/Budapest",
        "SEAFILE_ADMIN_EMAIL=me@example.com",
        "SEAFILE_ADMIN_PASSWORD=asecret",
        "SEAFILE_SERVER_LETSENCRYPT=false"
    ]

    ports = [
        {
            "internal" = 80
            "external" = "${var.seafile_port_80}"
            "protocol" = "tcp"
        },
        {
            "internal" = 443
            "external" = "${var.seafile_port_443}"
            "protocol" = "tcp"      
        }
    ]

    mounts = [{
            "target" = "/shared"
            "source" = "${var.seafile_data}"
            "type"   = "bind"
        }]

    networks_advanced = [{ 
        "name"    = module.seafile_net.name
        "aliases" = ["seafile"]
    }]

    depends_on = [
        module.seafile_mariadb_docker_container,
        module.seafile_memcached_docker_container
    ]
}