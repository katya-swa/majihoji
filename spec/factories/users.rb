FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name#{n}" }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
