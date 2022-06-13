# README

## Environment

- Ruby 2.7.2
- Docker
- Ruby on Rails '~> 6.1.5', '>= 6.1.5.1'
- Mysql 8.0

#### Step1 Clone this project

```bash
git clone https://github.com/SiThuBo/Trailblazer_rails.git
```

#### Step2 Start development environment using docker-compose

```bash
# Create Docker image from Dockerfile
docker-compose build

# Create Database
docker-compose run web bin/rails db:create
docker-compose run web bin/rails db:migrate
docker-compose run web bin/rails db:seed

# Start docker-compose services
docker-compose up -d

# Access the web container with bash
docker-compose exec web bash

# Node module installation
bin/yarn install

# Database migrate
bin/rails db:migrate

# Install simple_form
bin/rails generate simple_form:install

# End access to app container
exit

```
All you have to do is access `http: // localhost: 3000/`.

# to login with admin account
email => admin@gmial.com
pwd => Admin@123
# to login with user account 
email => user@gmail.com
pwd => User@123
