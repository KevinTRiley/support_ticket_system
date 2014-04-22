# This will guess the User class
FactoryGirl.define do
  factory :issue do
    description "issue description"
    state "new"
    urgency 0
    email "to@example.org"
  end
  factory :user do
    email "test@example.com"
    password "password"
    password_confirmation "password"
  end
end
