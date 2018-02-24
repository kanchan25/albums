class PicturesController < ApplicationController
  before_action :find_pictures, :only =>[:destroy, :remove_tag]

  before_action :find_albums, :only =>[:new, :destroy, :remove_tag, :create]


  def new
    @picture = @album.pictures.new
  end

  def remove_tag
    @picture.tag_list.remove(params[:tag])
    @picture.save
    redirect_to album_path(@album)
  end


  def create
    @picture = @album.pictures.create(picture_params)
    @picture.tag_list.add(params[:picture][:tag_list], parse: true)
    @picture.save 
    redirect_to album_path(@album)
  end

  def destroy
    @picture.destroy
    redirect_to album_path(@album)
  end
 
  private
    def picture_params
      params.require(:picture).permit(:title, :image)
    end	

    def find_pictures
      @picture = @album.pictures.find(params[:id])
    end

    def find_albums
      @album = Album.find(params[:album_id])
    end
end
