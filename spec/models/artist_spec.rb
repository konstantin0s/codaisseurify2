require 'spec_helper'
require 'rails_helper'

RSpec.describe Artist, type: :model do



  context 'validation tests' do
    it 'ensures name presence' do
      artist = Artist.new(name: 'Pavaroti').save
        end

    it 'ensures image_url presence' do
        end

    it 'should save successfully' do
        end
  end


  describe "association with songs" do
    let(:artist) {create :artist, name: "Livin la vida loca" }

    let!(:song1) { create :song, name: "Song1", artist: artist }
    let!(:song2) { create :song, name: "Song2", artist: artist }

    it "has many songs" do
      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated songs" do
      expect{ artist.destroy }.to change(Song, :count).by(-2)
    end

  end





  context 'scope tests' do

  end
end
