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
  end

  factory :instruction do
    recipe
    user
    ingredient
    unit "OZ"
    quantity 4
    add_point 30
    temperature "120F"
  end

  factory :ingredient do
    recipe
    user
    unit "LBS"
    quantity 4
    sequence(:item) { |n| "item#{n}" }
  end

  factory :comment do
    user
    recipe
    sequence(:body) { |n| "#{n} comment, fo shizzle." }
  end

  factory :batch do
    user
    recipe
    sequence(:batch_name) { |n| "#{n} BATCH" }
    bottling_option "22OZ"
    bottle_count 22
    bottle_brewed 25
    batch_notes "Yummy."
  end

  factory :profile do
    sequence(:username) { |n| "HerpDerp #{n}" }
    location "Boston, MA"
    avatar_url "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg"
    sequence(:brewop_name) { |n| "Salisbury Knolls #{n}" }
    user
  end
end
