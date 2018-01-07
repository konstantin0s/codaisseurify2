class SongsController < ApplicationController

  skip_before_action :verify_authenticity_token
   before_action :set_artist

   def show 
     @songs = @artist.songs
     @song = Song.new

   end

  def create
     @artist = Artist.find(params[:artist_id])
     @song = Song.create(song_params)
     respond_to do |format|
       if @song.save
         format.html { redirect_to artist_path(@artist), notice: "Song added" }
         format.json { render :show, status: :created, location: @song }
       else
         format.html { redirect_to artist_path(@artist) }
         format.json { render json: @song.errors, status: :unprocessable_entity }
       end
     end
 end

 def destroy
     @song = Song.find(params[:id])
     @song.destroy
     respond_to do |format|
       format.html { redirect_to artist_path(@artist) }
       format.json { head :no_content }
     end
 end


    private


        def song_params
           params.fetch(:song, {}).permit(:title)
        end


        def set_song
          @song = Song.find(params[:id])
        end



        def set_artist
          @artist = Artist.find(params[:artist_id])
        end


end
