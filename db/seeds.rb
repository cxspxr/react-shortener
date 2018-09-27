20.times do
  url = Faker::Internet.url
  shortened = Faker::FamilyGuy.character
  
  Link.create( url: url, shortened: shortened )
end
