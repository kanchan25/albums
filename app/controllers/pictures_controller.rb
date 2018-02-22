class PicturesController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.new
  end

  def remove_tag
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.find(params[:id])
    @picture.tag_list.remove(params[:tag])
    @picture.save
    redirect_to album_path(@album)
  end


  def create
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.create(picture_params)
    @picture.tag_list.add(params[:picture][:tag_list], parse: true)
    @picture.save 
    redirect_to album_path(@album)
  end

  def destroy
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.find(params[:id])
    @picture.destroy
 
    redirect_to album_path(@album)
  end
 
  private
    def picture_params
      params.require(:picture).permit(:title, :image)
    end	
end
