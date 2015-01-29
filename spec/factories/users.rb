FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "heythere#{n}@gmail.com" }
    password 'nowadays'
    first_name 'Henry'
    last_name 'Zaker'
  end
end
