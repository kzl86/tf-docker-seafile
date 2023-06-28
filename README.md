<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.2.6 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.19.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_seafile_docker_container"></a> [seafile\_docker\_container](#module\_seafile\_docker\_container) | git::https://github.com/kzl86/tf-docker_container.git | v1.1.0 |
| <a name="module_seafile_docker_image"></a> [seafile\_docker\_image](#module\_seafile\_docker\_image) | git::https://github.com/kzl86/tf-docker_image.git | v1.0.0 |
| <a name="module_seafile_mariadb_docker_container"></a> [seafile\_mariadb\_docker\_container](#module\_seafile\_mariadb\_docker\_container) | git::https://github.com/kzl86/tf-docker_container.git | v1.1.0 |
| <a name="module_seafile_mariadb_docker_image"></a> [seafile\_mariadb\_docker\_image](#module\_seafile\_mariadb\_docker\_image) | git::https://github.com/kzl86/tf-docker_image.git | v1.0.0 |
| <a name="module_seafile_memcached_docker_container"></a> [seafile\_memcached\_docker\_container](#module\_seafile\_memcached\_docker\_container) | git::https://github.com/kzl86/tf-docker_container.git | v1.1.0 |
| <a name="module_seafile_memcached_docker_image"></a> [seafile\_memcached\_docker\_image](#module\_seafile\_memcached\_docker\_image) | git::https://github.com/kzl86/tf-docker_image.git | v1.0.0 |
| <a name="module_seafile_net"></a> [seafile\_net](#module\_seafile\_net) | git::https://github.com/kzl86/tf-docker_network.git | v1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_seafile_container_name"></a> [seafile\_container\_name](#input\_seafile\_container\_name) | The name of the seafile container. | `string` | `"seafile"` | no |
| <a name="input_seafile_data"></a> [seafile\_data](#input\_seafile\_data) | Host path for the seafile data. | `string` | `"/opt/seafile-data"` | no |
| <a name="input_seafile_docker_image"></a> [seafile\_docker\_image](#input\_seafile\_docker\_image) | The name of the seafile docker image, including any tags or SHA256 repo digests. | `string` | `"seafileltd/seafile-mc:latest"` | no |
| <a name="input_seafile_docker_network_name"></a> [seafile\_docker\_network\_name](#input\_seafile\_docker\_network\_name) | The name of the docker network for seafile | `string` | `"seafile-net"` | no |
| <a name="input_seafile_environment"></a> [seafile\_environment](#input\_seafile\_environment) | Custom environment variables for seafile container. It will overwrite the module list if defined. | `list(string)` | `null` | no |
| <a name="input_seafile_keep_locally"></a> [seafile\_keep\_locally](#input\_seafile\_keep\_locally) | If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation. | `bool` | `true` | no |
| <a name="input_seafile_mariadb_container_name"></a> [seafile\_mariadb\_container\_name](#input\_seafile\_mariadb\_container\_name) | The name of the mariadb container. | `string` | `"seafile-mysql"` | no |
| <a name="input_seafile_mariadb_data"></a> [seafile\_mariadb\_data](#input\_seafile\_mariadb\_data) | Host path for the mariadb data. | `string` | `"/opt/seafile-mysql/db"` | no |
| <a name="input_seafile_mariadb_docker_image"></a> [seafile\_mariadb\_docker\_image](#input\_seafile\_mariadb\_docker\_image) | The name of the mariadb docker image, including any tags or SHA256 repo digests. | `string` | `"mariadb:10.6"` | no |
| <a name="input_seafile_mariadb_environment"></a> [seafile\_mariadb\_environment](#input\_seafile\_mariadb\_environment) | Custom environment variables for mariadb container. It will overwrite the module list if defined. | `list(string)` | `null` | no |
| <a name="input_seafile_mariadb_keep_locally"></a> [seafile\_mariadb\_keep\_locally](#input\_seafile\_mariadb\_keep\_locally) | If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation. | `bool` | `true` | no |
| <a name="input_seafile_memcached_container_name"></a> [seafile\_memcached\_container\_name](#input\_seafile\_memcached\_container\_name) | The name of the memcached container. | `string` | `"seafile-memcached"` | no |
| <a name="input_seafile_memcached_docker_image"></a> [seafile\_memcached\_docker\_image](#input\_seafile\_memcached\_docker\_image) | The name of the memcached docker image, including any tags or SHA256 repo digests. | `string` | `"memcached:1.6.18"` | no |
| <a name="input_seafile_memcached_keep_locally"></a> [seafile\_memcached\_keep\_locally](#input\_seafile\_memcached\_keep\_locally) | If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation. | `bool` | `true` | no |
| <a name="input_seafile_port_443"></a> [seafile\_port\_443](#input\_seafile\_port\_443) | Host port for the internal port 443. | `string` | `"443"` | no |
| <a name="input_seafile_port_80"></a> [seafile\_port\_80](#input\_seafile\_port\_80) | Host port for the internal port 80. | `string` | `"80"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->