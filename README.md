# Aweber ESP Integration - Ruby On rails


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Aweber ESP is a backend integration with Ruby On Rails which uses the API provided by ESP to make the queries.


  - User creation via form.
  - User creation via api.
  - Cron Job for user subscription.


###  Aweber Documentation

* [Aweber API](https://api.aweber.com/) - Aweber documentation page
* [Aweber Dev Account](https://labs.aweber.com/) - Aweber page for developers account


### Installation
 - Before start you need to install [redis](https://redis.io/topics/quickstart) in your local machine and [postgresql](https://gorails.com/setup/osx/10.15-catalina#database)

Clone the repository

```sh
$ git clone https://github.com/lscantillo/esp-aweber-integration
$ cd esp-aweber-integration
$ bundle install
```

Create local database and run the migrations

```sh
$ rails db:create
$ rails db:migrate
```
### Run Rails server
```sh
$ rails server
```
### Run Sidekiq cron jobs services
 - In an other command terminal run
```sh
$ bundle exec sidekiq
```
### Sidekiq Web Admin
```sh
 http://localhost:3000/sidekiq
```
 
# Usage
 ### Web form 
 - Go to http://localhost:3000/
 
 ### API 
 
- Go to http://localhost:3000/api/v1/new_lead

 ##### POST Method
 Content-type: application/json
  Body Parameters
 - name: string
 - email: string
 - phone: string
 - receive_mail: true or false
 

# Demo

This applications was deploy in Heroku at https://esp-aweber-integration.herokuapp.com/

