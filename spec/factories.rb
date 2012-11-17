require 'factory_girl'

FactoryGirl.define do
  factory :post do
    title "Test Title"
    content "Test Content"
  end
end