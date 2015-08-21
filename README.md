# Careerology

## Requirements

* PostgreSQL 9.4+
* Rails 4.2.3
* Ruby 2.2.2
* Bundler 1.10.6

## Up and running with docker toolbox

If you wish to run this in an isolated environment you will need to install docker, docker-compose.

If you have `homebrew` installed. Simply run:

```sh
$ brew install caskroom/cask/brew-cask
$ brew cask install dockertoolbox
```

and follow the instructions for installing docker toolbox.

After docker toolbox is up and running. To run the application simply build it:

```sh
$ docker-compose build web
$ docker-compose up
```

The app will be running under the `$(docker-machine ip dev):3000`

in another terminal

```
$ docker-compose run web rake db:create
$ docker-compose run web rake db:seed
```


## Up and running locally

### Setup

Modify the `config/database.yml` with your PostgreSQL specific options such as `host`, `username`, and `password`

### Running

```
$ rake db:setup
$ rails s
```

## Running Tests

Ensure the `database.yml` file contains the correct values for the database

```
$ RAILS_ENV=test rake db:create db:migrate
$ rspec spec
```



