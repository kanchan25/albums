class UsersController < ApplicationController
	def index
		debugger
		@album = current_user.albums.page params[:page]
	end
end
