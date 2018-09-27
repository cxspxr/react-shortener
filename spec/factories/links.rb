FactoryBot.define do
  factory :link do
    url { Faker::Internet.unique.url }
    shortened { Faker::Name.unique.name }
  end
end
