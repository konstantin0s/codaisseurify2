# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Photo.destroy_all
Song.destroy_all
Artist.destroy_all



artist1 = Artist.create!(name: "Elvis Presley")
artist2 = Artist.create!(name: "Lady Gaga")
artist3 = Artist.create!(name: "Jon Bon")
artist4 = Artist.create!(name: "Pavaroti")

artists_count = Artist.count
puts "#{artists_count} artists were created."


music1 = Song.create!( { name: "Livin la vida loca", artist: artist1 } ),
music2 = Song.create!( { name: "Si senior", artist: artist1 } ),
music3= Song.create!( { name: "Per tdffd", artist: artist2 } ),
music4 = Song.create!( { name: "oelle", artist: artist1 } ),
music5 = Song.create!( { name: "jujsto", artist: artist2 } ),
music6= Song.create!( { name: "amazing", artist: artist2 } ),
music7 = Song.create!( { name: "oelle", artist: artist3 } ),
music8 = Song.create!( { name: "jujsto", artist: artist4 } )

songs_count = Song.count
puts "#{songs_count} songs were created."

#photos
photo1 = Photo.create!(remote_image_url: "https://res.cloudinary.com/konstantin0s/image/upload/t_media_lib_thumb/v1514275273/tmp_KmXOpO_7dbb0d56aa4849ac_main_dwdlwv.jpg", artist: artist1)
photo2 = Photo.create!(remote_image_url: "https://res.cloudinary.com/konstantin0s/image/upload/t_media_lib_thumb/v1514274899/C1OaF6U9TDS._SL1000__otnflq.jpg", artist: artist3)
photo3 = Photo.create!(remote_image_url: "https://res.cloudinary.com/konstantin0s/image/upload/t_media_lib_thumb/v1514275126/032717-lady-gaga-best-beauty-lead_gyfmcl.jpg", artist: artist2)
photo4 = Photo.create!(remote_image_url: "https://res.cloudinary.com/konstantin0s/image/upload/t_media_lib_thumb/v1514274899/ss9-ojz7_cgdw7v.jpg", artist: artist4)


photos_count = Photo.count
puts "#{photos_count} photos were created."
