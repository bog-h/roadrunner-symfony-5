# Symfony 5 microservice working via RoadRunner and docker-compose
### Symfony 5 + RoadRunner + PHP 7.4 + PostgreSQL + Adminer: Docker Compose Build
#### Introduction
This is a base docker-compose build with the pure Symfony 5 project. It is
workinv via RoadRunner with PHP 7.4 and connected to the PostgreSQL, also it has Adminer for the DB management.
This project has additional monolog bundle for logs and doctrine budnle for checking DB connection.

#### Getting started
Start on of the next environment:
* make up-prod (For Production - working as daemon)
* make up-dev (Fod Development)
* make up-debug (For Debugging. XDebug - NOT WORKING, please open a MR if you will figure out how to run it)


#### Accessing
1. http://localhost:8080/ - You should see default Symfony Welcome Page
2. http://localhost:8081/ - Adminer DataBase Management Panel
3. PostgreSQL:
- database:db
- user:db
- password:db
