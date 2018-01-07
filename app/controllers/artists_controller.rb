class ArtistsController < ApplicationController
 before_action :set_artist, only: [:show, :edit, :update, :destroy]
 #skip_before_action :verify_authenticity_token


  def index #will have template
    @artists = Artist.all

  end


def show #will have template
  @artist = Artist.find(params[:id])
  @songs = @artist.songs
  @song = Song.new
   @photos = @artist.photos
end

def new #display the form
  @artist = Artist.new
end

def create #save new song
    @artist = Artist.new(allowed_params)

    if @artist.save
      image_params.each do |image|
      @artist.photos.create(image: image)
    end
      redirect_to artists_path, notice: "You just made an artist."
    else
      render 'new'
    end
end

  def edit #display for the existing song
    @artist = Artist.find(params[:id])
     @photos = @artist.photos
  end

  def update #save changes

     @artist = Artist.find(params[:id])
  if @artist.update_attributes(allowed_params)
     image_params.each do |image|
      @artist.photos.create(image: image)
    end
     redirect_to artist_path
  else
    render 'new'
  end

  end

#def destroy_song
#    @song = Song.find(params[:id])
#    @song.destroy
#    redirect_to artists_path
#  end

    def destroy
      @artist = Artist.find(params[:id])
      @artist.destroy

    respond_to do |format|
        format.html { redirect_to artists_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end



    private

    def image_params
      params[:images].present? ? params.require(:images) : []
    end

#def set_artist
  #   @artist = Artist.find(params[:id])
   #end

   def set_artist
       @artists = Artist.all
      end



   def set_songs
     @songs = Artist.find(params[:artist_id]).songs
   end

def allowed_params
    params.require(:artist).permit(:name, :image)

end


end
