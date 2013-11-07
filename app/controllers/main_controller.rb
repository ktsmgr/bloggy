class MainController < ApplicationController

	def index
	end

	def about_us

		name = params[:name]
		Rails.logger.info "Passed-in name = #{name}"
		#One way to pass info to the server side

		#Theoretically: Here is where we go to the DB and get a list of forbidden words
		@words = ["Forking", "Dongle", "Stuff"]
		@my_name = "Keala"
		@color = "beige"
	end

	def contact_us
	end

	def terms
	end
	
	def our_team
	end
	
	def company_vision
	end

end