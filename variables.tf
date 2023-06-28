variable "seafile_mariadb_docker_image" {
    description = "The name of the mariadb docker image, including any tags or SHA256 repo digests."
    type        = string
    default     = "mariadb:10.6"
}

variable "seafile_mariadb_keep_locally" {
    description = "If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
    type        = bool
    default     = true
}

variable "seafile_memcached_docker_image" {
    description = "The name of the memcached docker image, including any tags or SHA256 repo digests."
    type        = string
    default     = "memcached:1.6.18"
}

variable "seafile_memcached_keep_locally" {
    description = "If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
    type        = bool
    default     = true
}

variable "seafile_docker_image" {
    description = "The name of the seafile docker image, including any tags or SHA256 repo digests."
    type        = string
    default     = "seafileltd/seafile-mc:latest"
}

variable "seafile_keep_locally" {
    description = "If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
    type        = bool
    default     = true
}

variable "seafile_mariadb_container_name" {
    description = "The name of the mariadb container."
    type        = string
    default     = "seafile-mysql"
}

variable "seafile_memcached_container_name" {
    description = "The name of the memcached container."
    type        = string
    default     = "seafile-memcached"
}

variable "seafile_container_name" {
    description = "The name of the seafile container."
    type        = string
    default     = "seafile"
}

variable "seafile_mariadb_data" {
    description = "Host path for the mariadb data."
    type        = string
    default     = "/opt/seafile-mysql/db"
}

variable "seafile_port_80" {
    description = "Host port for the internal port 80."
    type        = string
    default     = "80"
}

variable "seafile_port_443" {
    description = "Host port for the internal port 443."
    type        = string
    default     = "443"
}

variable "seafile_data" {
    description = "Host path for the seafile data."
    type        = string
    default     = "/opt/seafile-data"
}

variable "seafile_docker_network_name" {
    description = "The name of the docker network for seafile"
    type        = string
    default     = "seafile-net"
}

variable "seafile_mariadb_environment" {
    description = "Custom environment variables for mariadb container. It will overwrite the module list if defined."
    type        = list(string)
    default     = null
}

variable "seafile_environment" {
    description = "Custom environment variables for seafile container. It will overwrite the module list if defined."
    type        = list(string)
    default     = null
}