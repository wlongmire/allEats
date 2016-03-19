class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.timestamps 	null: false

    	t.string 		:name
    	t.text 			:desc
    	t.string		:address
    	t.string		:phone_number
    	
    end
  end
end
