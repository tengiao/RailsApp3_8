require 'faker'

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    # email "tengiao@gmail.com"
    # password "yadayada"
    email
    password { Faker::Internet.password(8, 20) }
    first_name "Peter"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email
    password { Faker::Internet.password(8, 20) }
    first_name "Admin"
    last_name "User"
    admin true
  end
end
