
require 'spec_helper'
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
    let(:artist) { create :artist, name: "Livin la vida loca" }

    it "belongs to artist" do
      song = artist.songs.new

      expect(song.artist).to eq(artist)
    end

  end


  context 'scope tests' do

  end
end
