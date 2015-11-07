class CartController < ApplicationController

	before_action :load_cart_or_redirect_customer

	def index
		@title = "Your Cart"
	end

end
