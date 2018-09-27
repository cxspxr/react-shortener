FactoryBot.define do
  factory :link do
    url { Faker::Internet.url }
    shortened { Faker::FamilyGuy.character }
  end
end
