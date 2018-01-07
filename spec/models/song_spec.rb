require 'rails_helper'



RSpec.describe Song, type: :model do


  context 'validation tests' do
    it 'ensures name presence' do
      song = Song.new(name: 'Masquerada').save
        end



    it 'should save successfully' do
      song = Song.new(name: 'Masquerada').save
      expect(song).to eq(song)
        end
  end



  describe "song association with artist" do

      artist = Artist.create!(name: "Super Karma")

    it "belongs to artist" do
      song = artist.songs.new

      expect(song.artist).to eq(artist)
    end

  end


end
