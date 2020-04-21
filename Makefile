default: up-prod

up-prod:
	 @docker-compose down && \
         docker-compose build --parallel && \
         docker-compose \
             -f docker-compose.yml \
             -f docker-compose.prod.yml \
         up -d --remove-orphans\

up-dev:
	 @docker-compose down && \
         docker-compose build --parallel && \
         docker-compose \
             -f docker-compose.yml \
             -f docker-compose.dev.yml \
         up\

up-debug:
	 @docker-compose down && \
         docker-compose build --parallel && \
         docker-compose \
             -f docker-compose.yml \
             -f docker-compose.debug.yml \
         up\

down:
	@docker-compose down
