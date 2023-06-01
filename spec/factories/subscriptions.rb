FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.words(number: 3).join(" ") }
    price { Faker::Number.decimal(l_digits: 2) }
    status { ["active", "inactive"].sample }
    frequency { ["weekly", "biweekly", "monthly"].sample }
  end
end
