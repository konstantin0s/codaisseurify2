class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
   # before_action :set_artist


#   def show
#     json_response(@song)
# end

  def index
    songs = @artist.songs
    render status: 200, json: songs
end


def create
  artist = Artist.find(params[:artist_id])
  song = artist.songs.new(song_params)

  if song.save
    render status: 201, json: {
      message: "Song created",
      song: song
    }.to_json
  else
    render status: 422, json: {
      errors: song.errors
    }.to_json
  end
end

  def destroy
    @artist = Artist.find(params[:artist_id])
    song = Song.find(params[:id])
    song.destroy

    render status: 200, json: {
      message: "Song deleted"
    }.to_json
end




  private


  def song_params
     params.fetch(:song, {}).permit(:title)
  end




def set_artist
  @artist = Artist.find(params[:artist_id])
end



end
