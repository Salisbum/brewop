require_relative "helpers"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "12345678"
  end

  factory :recipe do
    user
    sequence(:name) { |n| "recipe#{n}" }
    beer_type "IPA"
    description "Very tasty."
    ingredients "So many ingredients!"
    brewing_instructions "So many instructions!"
  end
end
