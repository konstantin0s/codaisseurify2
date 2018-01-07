require 'spec_helper'
require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "association with artist" do
    let(:artist) { create :artist, name: "Jonny" }

    it "belongs to an artist" do
      photo = artist.photos.build(image: "Go to google.")

      expect(photo.artist).to eq(artist)
    end
  end
end
