require 'rails_helper'
require 'spec_helper'

feature ' songs', js: true do
  let(:artist) { create :artist, name: "Boca" }

  background do
    visit "/artists/#{artist.id}"


    # Enter description in the text field
    fill_in 'song_name', with: "Truelove"




    # Wait for 1 second so the backend can come back with a response
    sleep(1)
  end

    scenario 'add a new song' do
    # Expect the new task to be displayed in the list of songs

    find(".new_song").click
     page.execute_script("$('form').submit()")
       visit "/artists/#{artist.id}"

    expect(page).to have_content('Truelove')
    end


end
