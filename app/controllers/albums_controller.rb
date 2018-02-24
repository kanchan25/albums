class AlbumsController < ApplicationController
  before_action :find_albums, :only =>[:show, :edit, :update, :destroy]

  def new
  	@album = Album.new
  end

  def index
  	@album = Album.all.page params[:page]
  end

  def show
	  @pictures = @album.pictures.page params[:page]
  end

  def edit
  end

  def create
    @album = current_user.albums.new(album_params)
    
  	if @album.save
  	  redirect_to @album
  	  else
        render 'new'
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
 
    redirect_to albums_path
  end

  private

  	def album_params
      params.require(:album).permit(:title,:cover)
  	end

    def find_albums
       @album = Album.find(params[:id])
    end
    
end
