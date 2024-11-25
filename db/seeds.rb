# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# all the stuff above is auto generated when you make a new rails skeli

User.create email: 'name@example.com', password: 'secret'

Category.create [
  { name: 'Programming' },
  { name: 'Events' },
  { name: 'Drama' },
  { name: 'Motorsports' },
  { name: 'World-news' },
  { name: 'other' }
]

user.articles.create([
                       {
                         title: 'Advanced Active Record',
                         body: 'models need to relate to eachother. In the real world,...',
                         published_at: Date.today
                       },
                       {
                         title: 'one to many associations',
                         body: 'one to many assciations describe a pattern...',
                         published_at: Date.today
                       },
                       {
                         title: 'Associations',
                         body: 'how stuff is related to eachother',
                         published_at: Date.today
                       }
                     ])

# $ rails db:seed        is what polulates the db
# if i need to add more seeds in the future use $ rails db:setup to clean it up then re-make so you dont get duplicates
