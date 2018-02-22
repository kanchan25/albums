class AlbumsController < ApplicationController
  def new
  	@album = Album.new
  end

  def index
  	@album = Album.all.page params[:page]
  end

  def show
	  @album = Album.find(params[:id])
    @pictures = @album.pictures.page params[:page]
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    
    @album = current_user.albums.new(album_params)
    #@album = @user.album.new(album_params)
    
  	if @album.save
  	  redirect_to @album
  	  else
        render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])
 
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
 
    redirect_to albums_path
  end

  private
  	def album_params
      params.require(:album).permit(:title,:cover)
  	end


end
