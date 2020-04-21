Docker-compose with RoadRunner, Symfony 5 and PostgreSQL

Symfony 5 is pure with extra monolog bundle for logs and doctrine budnle to check DB connection

Start one of the environment by command:

make up-prod (For Production Configurations)
make up-dev (Fod Development Configurations)
make up-debug (For Debugging and XDebug - NOT WORKING, please open a MR if you will figure out how to run it)

Open http://localhost:8080/