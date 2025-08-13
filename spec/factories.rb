require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Crypto.md5 }
  end

  factory :scenario do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    modality { 'desktop' }
  end

  factory :play_session do
    association :user
    association :scenario
    sequence(:started_at) { |n| Time.current.change(usec: 0) + n.seconds }
    ended_at { started_at + 30.minutes }
  end

  factory :feedback do
    association :play_session
    score { 80 }
    notes { Faker::Lorem.sentence }
  end
end
