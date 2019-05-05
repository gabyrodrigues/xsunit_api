# X-SUNIT (Extraterrestrial Survival Unit)

This API was developed as a Backend Challenge to Gocase's recruitment process for internship.

### On this API it's possible to:

* Add survivors to the database
* Update survivor location
* Report survivor abduction

### Reports:

This API offer the following reports:

- Percentage of abducted survivors;
- Percentage of non-abducted survivors
- List of all survivors names, by alphabetic order, with an identification to know who was abducted.


## Documentation

The documentation for X-SUNIT API endpoints and how to use them, can be found on [this link](https://documenter.getpostman.com/view/7402886/S1LtzoQB). 

## Dependencies

- Ruby 2.3.1

- Rails 5.2.3

- Postman was used to test and document all the endpoints

## Configuration

- Clone the project:
    ```
    git clone https://github.com/gabyrodrigues/xsunit_api.git
    ```

- Install the gems:
    ```
    bundle install
    ```

- Create a new database called 'dev'

- Create a new schema called 'xsunit_api'

- Run the migrations:
    ```
    rails db:migrate
    ```

- Populate the database with survivors (optional):
    ```
    rails db:seed
    ```
