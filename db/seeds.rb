# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "JeffJ", password_digest: "hello", first_name: "Jeff", last_name: "Jones", email: "jeff@me.com")

Company.create(name: "Championship Trading", industry: "Sports", pitch_text: "We are a company dedicated to providing a stock market based on the odds of each team in a given league to win the championship", pitch_url: "https://www.youtube.com/embed/SQM1NjL0_Fc", user: User.first)
