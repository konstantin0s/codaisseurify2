require 'rails_helper'

 describe "view artist page" do

  let(:artist) { create :artist, name: "Crazy" }

   it "shows the artist's details" do
     visit artist_path(artist)

     expect(page).to have_text(artist.name)
  

   end
 end
