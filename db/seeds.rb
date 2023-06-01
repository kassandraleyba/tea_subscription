# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Main St")
customer2 = Customer.create(first_name: "Jane", last_name: "Smith", email: "jane.smith@example.com", address: "456 Elm St")

tea1 = Tea.create(title: "Green Tea", description: "Refreshing green tea", temperature: 80, brew_time: 3)
tea2 = Tea.create(title: "Black Tea", description: "Bold black tea", temperature: 95, brew_time: 5)

subscription1 = Subscription.create(title: "Monthly Green Tea", price: 10.99, status: 0, frequency: 2, customer: customer1, tea: tea1)
subscription2 = Subscription.create(title: "Weekly Black Tea", price: 8.99, status: 0, frequency: 0, customer: customer2, tea: tea2)