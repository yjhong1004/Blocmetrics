require 'faker'

#Create registered apps
50.times do
  RegisteredApplication.create!(
  name: Faker::Lorem.word,
  url:  Faker::Internet.url

  )


end

registered_applications = RegisteredApplication.all


#Create events
100.times do

  Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Lorem.sentence
  )
end
events = Event.all

puts "Seed finished"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
