require 'spec_helper'
require 'rails_helper'


RSpec.describe ArtistsController, type: :controller do

    context 'GET #index' do
      it 'returns a success response' do
         get :index
         expect(response).to be_success #response.success?
       end
    end

    context 'GET #show' do
      it 'returns a success response' do

        artist = Artist.create!(name: "Super Karma")
        get :show, params: { id: artist.to_param }
        expect(response).to be_success
      end
    end



end
