# Escolhendo versão mysql
FROM mysql:8

# copiando meu script .sql para uma pasta dentro do docker
COPY ./db/ /docker-entrypoint-initdb.d/
