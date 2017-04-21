# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Comment.delete_all

User.create! email: 'admin@example.com', password: '12345678', name: 'Admin', surname: 'Ivanovich'

10.times do
  User.create! email: Faker::Internet.email,
               password: '12345678',
               name: Faker::Name.first_name ,
               surname: Faker::Name.last_name
end

30.times do
  Comment.create! user: User.all.sample,
                  content: Faker::Lorem.paragraph
end
