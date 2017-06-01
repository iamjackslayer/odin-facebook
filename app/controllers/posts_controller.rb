class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(content: params[:post][:content])
		@post.save
		redirect_to root_path
	end

	def show
		@post = Post.find_by_id(params[:id])
	end

	def increment_number_of_likes
		@post = Post.find_by_id(params[:id])
		@post.likers << current_user
		@post.number_of_likes += 1
		@post.save
		redirect_to("/post/#{params[:id]}/show")
	end

	def decrement_number_of_likes
		@post = Post.find_by_id(params[:id])
		@post.likers.delete(current_user)
		@post.number_of_likes -= 1
		@post.save
		redirect_to("/post/#{params[:id]}/show")
	end
end
