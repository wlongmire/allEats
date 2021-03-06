class RestaurantController < ApplicationController
	before_filter :authenticate_owner!
	before_action :authenticate_owner!
	
	def index
		@restaurants = Restaurant.where({owner:current_owner})

		respond_to do | format |
			format.html
			format.json {render :json => @restaurants }
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		respond_to do | format |
			format.html
			format.json {render :json => @restaurant }
		end
	end

	def new
	end

	def create
		@restaurant = Restaurant.create(params.require(:restaurant).permit(:name, :owner, :address, :phone_number, :desc));
		@restaurant.owner = current_owner
		if @restaurant.save
			flash[:success] = "Successfully Created."
			redirect_to ({action: :show, id: @restaurant.id})
		else
			flash[:alert] = @restaurant.errors.full_messages.join(", ")

			render :new
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params.require(:restaurant).permit(:name, :address, :phone_number, :desc))
		redirect_to ({action: :show, id: 1})
	end

	def destroy
		Restaurant.find(params[:id]).destroy
		
		redirect_to ({action: :index})
	end
end