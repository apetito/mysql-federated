# MySQL Federated Engine

A idéia desse container é para exemplificar o uso da engine FEDERATED do MySQL para fazer consultas com JOIN entre diferentes hosts

### Instalação

Siga esses passos para executar os containers, criar a rede entre eles e o banco dados em cada um

1. Clone o repositório
2. Crie rede dos containers:
```
docker network create --driver=bridge --subnet=171.0.0.0/16 --gateway=171.0.0.1 mediumnet
```
3. Execute o comando para iniciar os containers
```
docker-compose up -d
```
4. Dentro da pasta `dump` execute os seguintes comandos para criar o banco com as tabelas:
```
mysql -uroot -proot -h171.0.0.20 -e "source loja_1.sql"
mysql -uroot -proot -h171.0.0.21 -e "source loja_2.sql"
```
