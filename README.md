# Tea Subscription Service

Welcome to the Tea Subscription Service API! This API provides a convenient and seamless way for customers to subscribe to tea subscriptions, manage their subscriptions, and enjoy a delightful tea experience delivered right to their doorstep. Developed using Ruby on Rails, this API ensures a smooth and efficient flow of data, making it easy for Frontend Developers to integrate it into their applications.

### Built With

[![Rails](https://img.shields.io/badge/Built%20with-Rails-red)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue)](https://www.postgresql.org/)
[![Puma](https://img.shields.io/badge/Web%20Server-Puma-orange)](https://github.com/puma/puma)
[![Capybara](https://img.shields.io/badge/Testing-Capybara-green)](https://github.com/teamcapybara/capybara)
[![Shoulda-Matchers](https://img.shields.io/badge/Testing-Shoulda%20Matchers-lightgrey)](https://github.com/thoughtbot/shoulda-matchers)
[![RSpec](https://img.shields.io/badge/Testing-RSpec-red)](https://rspec.info/)

## Getting Started
<!-- can change this later or add more detail -->
### Prerequisites

* Ruby
  ```sh
  Ruby 3.1.1
  ```

* Rails
  ```sh
  Rails 7.0.4.3
  ```
* [PostgreSQL](https://www.postgresql.org/download/)

<br />

### Installation

_Follow the steps below to install and set up this app._

1. Clone this Repository
   ```sh
   git clone git@github.com:kassandraleyba/tea_subscription.git
   ```
2. In your terminal, run the following commands;
    ```sh
    bundle install
    rails db:{drop,create,migrate,seed}
    ```

    <p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />

## Schema

<br />

   ![schema](images/schema.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />

# Endpoints

- GET localhost:3000/api/v1/customers/2/subscriptions/

![get](images/get.png)

<br>

- POST localhost:3000/api/v1/customers/2/subscriptions/

![post](images/post.png)

<br>

- PATCH localhost:3000/api/v1/customers/1/subscriptions/1

![patch](images/patch.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />