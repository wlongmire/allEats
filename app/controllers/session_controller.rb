class SessionController < ApplicationController
	#login
	def new
	end

	#logout
	def destroy
		redirect_to ({action: :new})
	end
end