20.times do
  url = Faker::Internet.unique.url
  shortened = Faker::Number.unique.number

  link = Link.create( url: url, shortened: shortened )

  redirects = []
  3.times do
    redirects.push(Redirect.new( time: Time.now, location: Faker::Address.city ))
  end

  redirects.each do |redirect|
    redirect.link = link
    redirect.save
  end
end
