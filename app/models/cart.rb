class Cart < ActiveRecord::Base
	include CheckoutSharedMethods
	belongs_to :customer
	#has_and_belongs_to_many :products # this is for joint table, not line-item table
	has_many :line_items, as: :itemized
	has_many :products, through: :line_items

	delegate :email, to: :customer


end
