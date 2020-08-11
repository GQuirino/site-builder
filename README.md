# README

docker-compose build
docker-compose run --rm web rake db:create db:setup
docker-compose run web rspec
docker-compose up -d web

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
