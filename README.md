# Census ![alt "build status"](https://travis-ci.org/erickbrower/census.svg?branch=development)

WIP web application for managing middle and high school student information and
grades. Take exams, create assignments, and manage courses. Uses Rails 5 and
AngularJS 4.

## Installation

1. `git clone git@github.com:erickbrower/census.git`
2. `bundle install`
3. `bin/rails db:create db:schema:load db:seed`
4. `bin/rails s`

## Testing
Using FactoryGirl and RSpec
* `bin/rspec spec`

## Extras
* Create an entity relationship diagram (ERD) PDF with `bundle exec erd`
