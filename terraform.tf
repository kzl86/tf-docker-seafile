terraform {
    required_version = "1.2.6"

    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "2.19.0"
        }
    }
}