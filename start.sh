#! /bin/bash
readonly ENV_DEBUG="debug"
readonly ENV_DEV="dev"
readonly ENV_PROD="prod"
readonly ENV=$1

composer_prod() {
  echo "Installing composer packages"
  composer install --no-dev --optimize-autoloader --no-scripts --no-plugins --prefer-dist --no-progress --no-interaction
  echo "Composer packages were installed successfully"
}
composer_dev() {
  echo "Installing composer packages"
  composer install --optimize-autoloader --no-scripts --no-plugins --prefer-dist --no-progress --no-interaction
  echo "Composer packages were installed successfully"
}

roadrunner() {
  echo "Installing RoadRunner"
  yes Y | ./vendor/bin/rr get --location bin/
  echo "RoadRunner was installed successfully"
}

enviroment_prod() {
  FILE=.env
  echo "Copying $FILE file"
  if [ -f "$FILE" ]; then
    echo "$FILE file is already exists"
  else
    cp environments/env.prod .env
    echo "$FILE copied"
  fi
}

enviroment_dev() {
  FILE=.env
  echo "Copying $FILE file"
  if [ -f "$FILE" ]; then
    echo "$FILE file is already exists"
  else
    e_error "$FILE does not exist"
    e_note "Copying $FILE..."
    cp environments/env.dev .env
    e_success "$FILE copied"
  fi
}

serve_prod() {
  php bin/console cache:warmup
  bin/rr serve
}

serve_dev() {
  php bin/console cache:warmup
  bin/rr serve -v
}

serve_debug() {
  php bin/console cache:warmup
  bin/rr serve -v -d -o 'http.workers.pool.numWorkers=1' -o 'http.workers.pool.maxJobs=1'
}

start_prod() {
  enviroment_prod
  composer_prod
  roadrunner
  serve_prod
}

start_dev() {
  enviroment_dev
  composer_dev
  roadrunner
  serve_dev
}

start_debug() {
  enviroment_dev
  composer_dev
  roadrunner
  serve_debug
}

run() {
  case $ENV in
  $ENV_PROD)
    echo "Starting prod enviroment!"
    start_prod
    ;;
  $ENV_DEV)
    echo "Starting dev enviroment!"
    start_dev
    ;;
  $ENV_DEBUG)
    echo "Starting debug enviroment"
    start_debug
    ;;
  *)
    echo "Please select an enviroment [debug, dev, prod]! Example: start.sh dev"
    ;;
  esac
}
run
