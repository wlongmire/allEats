require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  it 'validates name validation' do
	restaurant = Restaurant.new
  	restaurant.valid?

  	restaurant

  	expect(restaurant.errors.messages[:name]).to include "can't be blank"
  end

  it 'validates the presence of name' do
	restaurant = Restaurant.new
	restaurant.name = "tempName"
  	restaurant.valid?

  	expect(restaurant.errors.messages.has_key?(:name)).to eq(false)
  end
end
