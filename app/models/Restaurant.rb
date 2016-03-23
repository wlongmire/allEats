class Restaurant < ActiveRecord::Base
	
	validates :name, presence: true
    validates :owner, presence: true

	belongs_to :owner
end