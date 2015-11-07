class Cart < ActiveRecord::Base
	belongs_to :customer
	#has_and_belongs_to_many :products # this is for joint table, not line-item table
	has_many :line_items
	has_many :products, through: :line_items

end
