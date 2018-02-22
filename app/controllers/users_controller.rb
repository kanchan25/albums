class UsersController < ApplicationController
	def index
		@album = current_user.albums.page params[:page]
	end
end
