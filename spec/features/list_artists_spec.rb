require 'rails_helper'

describe "list of all artists" do




  let!(:artist1) { create :artist, name: "Bure"}



  it "shows all artists" do
    visit artists_path

    expect(page).to have_text("Bure")

  end
end
