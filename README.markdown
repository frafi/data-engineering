# Project Description 
This is a simple web application that allows user to upload a tab-delimited file containing sales data. If upload is successful, the gross revenue (or sales) from the uploaded file is displayed. It uses Rails 4.0.3, Ruby 2.0, SQLite 3.0, HAML, RSpec, Factory Girl, Money and Roo gems. 

## Prerequisites
Install Ruby 2.0.0 (or later) version. You can do this with Ruby Version Manager (RVM) with the following command:

   rvm install 2.0.0
   rvm use 2.0.0 --default

## Deployment Instructions
1. Clone the repository
1. Install all gems using the following command: **bundle install**
1. Run the server using the following command: **bundle exec rails start**
1. Browse to http://localhost:3000 (or http://lvh.me:3000) to see the import page

## To run the tests
Run the following command to run all unit tests for this project: **rspec spec**

