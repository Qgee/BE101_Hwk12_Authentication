class HomeController < ApplicationController

	def index
		@posts = Post.all
    @authors = Author.all
	end

	def post_details 
		@posts = Post.all
	end

end