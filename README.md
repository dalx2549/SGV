# README

* Ruby version

  Ruby 2.3.0
  Ruby on Rails 5.0.1

* System dependencies
  
  PostgreSQL 9.6:
  
  ```
  $ brew install postgresql
  CREATE EXTENSION "uuid-ossp";
  ```
  
  ImageMagick:
  
  `$ brew install imagemagick`
  
  Redis:
  
  `$ brew install redis`

* Configuration

  `$ bundle install`
  
* Database creation

  `$ rake db:create`
  
* Database initialization
  
  ```
  $ rake db:migrate
  $ rake db:seed
  ```

* How to run the app

  ```
  $ redis-server
   $ bundle exec sidekiq
  $ rails s
  ```

