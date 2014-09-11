# Log System

This docker image consists of

- logstash
- elasticsearch
- kibana
- nginx for http auth

## How to run

1. prepare file `./kibana.htpasswd` for http auth
2. modify the `Makefile` as you need
3. run `make build`
4. run `make run`

## Note for generate htpasswd

    sudo apt-get install apache2-utils
    sudo htpasswd -c ./kibana.htpasswd exampleuser
