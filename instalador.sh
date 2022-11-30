#!/bin/bash

#Instalação JAVA
echo \"[Script de Instalação da ISEE]\"

java -version
if [ $? -eq 0 ]
    then
    echo \"[Java já instalado]\"
    sleep 6
    else
    echo \"[Java ainda não instalado]\"

    echo \"[Preparando para instalação...instalando pacote Java...]\"
        echo \"[instalando repositório...]\"
        sleep 6
        sudo add-apt-repository ppa:webupd8team/java -y
        clear
        echo \"[[Atualizando repositório...]\"
        sleep 
        sudo apt-get update -y
        clear

        echo \"[Instalando Java - versão 11...]\"
        sudo apt-get install default-jre -y
        sleep 10
        clear
        echo \"[Java instalado - versão 11 ]\"
        sleep 2

fi

#Instalação DOCKER
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
            
            sudo docker build -t dockerfile .
            sudo docker run -d -p 3306:3306 --name ContainerBD -e MYSQL_ROOT_PASSWORD='urubu100' -e MYSQL_DATABASE='isee' dockerfile
    fi


#ABRIR APLICACAO

 git clone https://github.com/iSee-sptech/java.git
 cd java
 
  echo \"[Qual java deseja iniciar? Aperte]\"
  echo \"[1 - CLI | 2 - Interface Gráfica]\"
  read inst
	if [ \"$inst\" == \"1\" ]
        then
        cd java/CLI-ISEE/target
        clear
        java -jar isee-1.0-SNAPSHOT-jar-with-dependencies.jar 
        else
        cd java/isee/target
        clear
        java -jar isee-1.0-SNAPSHOT-jar-with-dependencies.jar 
