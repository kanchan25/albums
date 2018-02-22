class CommentsController < ApplicationController
    def new
  	  @comment = Comment.new(params[:comment])
	end


	def create
		 @album = Album.find(params[:album_id])
		 @picture = @album.pictures.find(params[:picture_id])
		 @comment = @picture.comments.create(comment_params)
		 @comment.save 
		 redirect_to @album
	end

	private
    def comment_params
       params.require(:comment).permit(:comment)
    end	


end
