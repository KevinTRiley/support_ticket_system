# This will guess the User class
FactoryGirl.define do
  factory :issue do
    description "issue description"
    state "new"
    urgency 0
    picture { File.new(File.join(Rails.root, 'spec', 'support', 'text-file-icon.png')) }
  end
end