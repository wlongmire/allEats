class Restaurant < ActiveRecord::Base
	
	validates :name, presence: true
    validates :address, presence: true

	belongs_to :owner
end