# This will guess the User class
FactoryGirl.define do
  factory :issue do
    description "issue description"
    state "new"
    urgency 0
    email "to@example.org"
  end
  factory :user do
    email "to@example.org"
    password "foobar"
    password_confirmation "foobar"
  end
end
