class RestaurantController < ApplicationController
	before_action :authenticate_owner!
	
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
	end

	def create
		@restaurant = Restaurant.create(params.require(:restaurant).permit(:name, :address, :phone_number, :desc));

		redirect_to ({action: :show, id: @restaurant.id})
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