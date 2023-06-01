FactoryBot.define do
  factory :tea do
    title { Faker::Lorem.words(number: 3).join(" ") }
    description { Faker::Lorem.sentence }
    temperature { Faker::Number.between(from: 70, to: 100) }
    brew_time { Faker::Number.between(from: 1, to: 10) }
  end
end
