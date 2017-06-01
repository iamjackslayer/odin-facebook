class UsersController < ApplicationController
	def index
		if user_signed_in?
			@friends = current_user.friends
		end
	end

	def profile
		@target_user = (User.find_by_email(params[:user][:email]) if params.has_key? :user) || User.find_by_id(params[:id]) 

	end
end
