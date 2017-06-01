class FriendshipsController < ApplicationController
	def create
		@friend = User.find_by_id(params[:id])
		# both parties approve
		current_user.friends << @friend unless current_user.friends.include? @friend
		@friend.friends << current_user unless @friend.friends.include? current_user
			

		#delete notification
		current_user.notifications.find_by_requester_id(@friend.id).destroy

		redirect_to("/user/#{params[:id]}/profile")
	end

	def send_request
		@friend = User.find_by_id(params[:id])
		create_unique_notification @friend
		redirect_to("/user/#{params[:id]}/profile")
	end

	def destroy
		#unfriend, deleting the two-way frienship
		@friend = User.find_by_id(params[:id])
		current_user.friends.delete(@friend) if current_user.friends.include? @friend
		@friend.friends.delete(current_user) if @friend.friends.include? current_user

		redirect_to("/user/#{params[:id]}/profile")
	end

	private

	def create_unique_notification(friend)
		if !friend.notifications.find_by_requester_id(current_user.id)
			friend.notifications.create(requester_id: current_user.id)
		end
	end
end
