require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do |index|
  User.create!(first_name: Faker::Games::SuperMario.character,
               last_name: Faker::Games::SuperMario.character,
               email: "users#{index}" + "@yopmail.com",
               password: "coucoucoucou",
               description: Faker::Lorem.paragraph_by_chars(number: rand(20..50)))
end


10.times do
  Event.create!(start_date: Faker::Date.between(from: "2021-02-20", to: "2021-09-25"),
                duration: [30, 60, 90, 120, 180, 210].sample,
                title: Faker::Movies::HarryPotter.spell ,
                description: Faker::Movies::HarryPotter.quote,
                price: rand(1..1000),
                location: Faker::Address.city,
                admin: User.all.sample)
end


10.times do
  Attendance.create!(user: User.all.sample,
                     event: Event.all.sample)
end