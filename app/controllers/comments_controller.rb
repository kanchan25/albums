class CommentsController < ApplicationController
    def new
  	  @comment = Comment.new(params[:comment])
	end


	def create
		 @album = Album.find(params[:album_id])

		 @comment = current_user.comments.create!(comment_params)
		 redirect_to @album
	end

	private
    def comment_params
       params.require(:comment).permit(:comment,:picture_id)
    end	


end
