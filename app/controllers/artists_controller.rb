class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

   def index
     @artists = Artist.all
     #@artists = Artist.order_by_name_or_create(params[:order_by])
   end

   def show
     #@songs = @artist.songs.paginate(:page => params[:page], per_page: 5)
     @songs = @artist.songs

   end

   def new
     @artist = Artist.new
   end

   def create
     @artist = Artist.new(artist_params)

     if @artist.save
       new_photo
       redirect_to edit_artist_path(@artist), notice: "Artist created"
     else
       render :new
     end
   end

   def edit
   end

   def update
     @artist.update(artist_params)
     if @artist.update(artist_params)
       new_photo
       redirect_to artist_path(@artist), notice: "Artist updated"
     else
       render :edit
     end
   end

   def destroy
     if @artist.destroy
       redirect_to root_path, notice: "Artist removed"
     else
       redirect_to @artist, notice: "Cannot delete that Artist"
     end
   end

   private

   def new_photo
     if !image_params.nil?
       @artist.photo.destroy unless @artist.photo.nil?
       @artist.photo = Photo.create(image: image_params)
     end
   end

   def set_artist
     @artist = Artist.find(params[:id])
   end

   def image_params
   params[:images].present? ? params.require(:images) : nil
   end

   def artist_params
     params
     .require(:artist)
     .permit(:name)
 end

end
