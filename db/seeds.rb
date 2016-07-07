# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.create!(media_url: "https://static.pexels.com/photos/279/black-and-white-branches-tree-high.jpg",
             screen_name: "Example User",
             profile_image_url: "http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg",
             source: "nose",
             time_of_post: '2001-02-03T04:05:06+07:00',
             text: "la vida",
             post_id: "1")

Post.create!(media_url: "http://colonialhousequito.com/images/quito-ecuador.jpg",
             screen_name: "Example User Cat",
             profile_image_url: "http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg",
             source: "nose",
             time_of_post: '2001-02-03T04:05:06+07:00',
             text: "la vida",
             post_id: "2")

Post.create!(media_url: "http://colonialhousequito.com/images/quito-ecuador.jpg",
             screen_name: "Example User Cat",
             profile_image_url: "https://dl.dropboxusercontent.com/u/72193719/away.jpg",
             source: "nose",
             time_of_post: '2001-02-03T04:05:06+07:00',
             text: "la vida",
             post_id: "12")

5.times do |n|
  media_url = "http://www.carasycaretas.com.uy/wp-content/uploads/2016/04/07/VolcanChimborazo-e1460047369278.jpg"
  screen_name = Faker::Name.name
  profile_image_url = Faker::Placeholdit.image("50x50", 'jpg')
  source = Faker::Hacker.adjective
  time_of_post = Faker::Date.between(2.days.ago, Date.today)
  text = Faker::Hacker.say_something_smart
  post_id = Faker::Number.number(2)
  Post.create!(media_url: media_url,
               screen_name: screen_name,
               profile_image_url: profile_image_url,
               source: source,
               time_of_post: time_of_post,
               text: text,
               post_id: post_id)
end