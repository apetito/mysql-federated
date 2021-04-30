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
