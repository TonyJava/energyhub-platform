FactoryGirl.define do
  factory :user do
    first_name "Michelle"
    last_name "Obama"
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
