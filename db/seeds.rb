# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "JeffJ", password_digest: "hello", first_name: "Jeff", last_name: "Jones", email: "jeff@me.com")
Company.create(name: "Championship Trading", industry: "Sports", pitch_text: "We are a company dedicated to providing a stock market based on the odds of each team in a given league to win the championship", pitch_url: "https://www.youtube.com/embed/SQM1NjL0_Fc", user: User.first)
Company.create(name: "FundMonster", industry: "Technology", pitch_text: "We're the Fund Monster", pitch_url: "https://www.youtube.com/embed/tm2Jy64b0dI", user: User.first)
