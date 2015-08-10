# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "JeffJ", password: "hello", password_confirmation: "hello", first_name: "Jeff", last_name: "Jones", user_type: "entrepreneur", email: "jeff@me.com")
User.create(username: "SteveS", password: "hello", password_confirmation: "hello", first_name: "Steve", last_name: "Smith", user_type: "entrepreneur", email: "steve@me.com")
Company.create(name: "Championship Trading", industry: "Sports", pitch_text: "Banksy Blue Bottle pickled vegan tofu banjo. Whatever cred health goth meditation wolf trust fund. Hella umami Vice freegan mumblecore Helvetica. Pork belly small batch Pinterest literally fap. Mustache put a bird on it wolf, taxidermy VHS butcher biodiesel shabby chic vegan DIY Austin forage post-ironic McSweeney's. Selvage narwhal street art migas DIY chia. Roof party typewriter squid, master cleanse organic occupy church-key sustainable mumblecore flexitarian iPhone blog jean shorts.

", pitch_url: "https://www.youtube.com/watch?v=SQM1NjL0_Fc", user: User.first)

Company.create(name: "FundMonster", industry: "Technology", pitch_text: "Meggings narwhal cray squid, flexitarian Truffaut locavore pickled drinking vinegar keytar. Tattooed Odd Future Williamsburg, forage keytar squid pork belly 90's YOLO. Echo Park Shoreditch Tumblr, trust fund Odd Future listicle retro narwhal McSweeney's roof party you probably haven't heard of them plaid lumbersexual taxidermy. Food truck umami wayfarers actually, Neutra American Apparel biodiesel. DIY taxidermy kale chips twee, forage keytar retro. Mustache salvia skateboard, next level cornhole cliche pour-over. VHS salvia raw denim Tumblr, gastropub Shoreditch Blue Bottle Thundercats vegan cronut wolf.", pitch_url: "https://www.youtube.com/watch?v=tm2Jy64b0dI", user: User.last)

# Excellent job seeding user data! Consider adding more seed data for some of the more advanced functionality in your app in the future:
# like the watchlist, facorites, and messages.
