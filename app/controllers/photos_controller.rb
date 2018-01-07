class PhotosController < ApplicationController
before_action :set_artist, only: [:show, :edit, :update, :destroy]
#before_action :set_photo, only: [:show, :edit, :update, :destroy]

def destroy
  photo = Photo.find(params[:id])
  @artist = photo.artist
  photo.destroy
  redirect_to edit_artist_path(@artist), notice: "Photo successfully removed"
end

    private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def image_params
          params[:images].present? ? params.require(:images) : nil
        end

        def set_photo
          @photo = Photo.find(params[:id])
        end


end
