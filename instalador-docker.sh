#!/bin/bash
 docker -version

    if [$? -eq 0]
        then
        echo \"[Docker já instalado]\"
        sleep 3
    else
        echo \"[Docker ainda não instalado...]\"
        sleep 3

        echo \"[Preparando para iniciar instalação....Instalando Docker...]\"
            echo 
            sudo apt update 
            sleep 4

            sudo apt install docker.io -y
            sleep 4
            
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo service docker start

            sudo docker pull mysql:8
            sleep 4
            
            docker build -t dockerfile .
            docker run -d -p 3306:3306 --name ContainerBD -e MYSQL_ROOT_PASSWORD='urubu100' -e MYSQL_DATABASE='isee' dockerfile
    fi

