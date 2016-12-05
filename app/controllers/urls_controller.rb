class UrlsController < ApplicationController

	def index 
	end

	def new 
		@url = Url.new
		
	end

	def create
		@url = Url.new(url_params)
		@url.short_url = SecureRandom.base64[0..8]
		if @url.save
			flash.notice = "Short Url Was created successfully"
			redirect_to urls_path
		else
			@errors = @url.errors.full_messages
			render 'new' 
		end
	end

	private 
	def url_params
		params.require(:url).permit(:long_url)
	end
end
