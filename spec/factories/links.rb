FactoryBot.define do
  factory :link do
    url { Faker::Internet.unique.url }
    shortened { Faker::Number.unique.number }
  end
end
