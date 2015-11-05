class CartController < ApplicationController

	before_action :load_cart_or_redirect_customer

	def index
		@title = "Your Cart"
	end

	def create
		product = Product.find(params[:product_id])
		@cart.products << product
		@cart.save
		redirect_to '/cart', notice: "#{product.title} was added to your cart." and return
	end
private
	def load_cart_or_redirect_customer
		if customer_signed_in?
			current_customer.create_cart if current_customer.cart.nil?
			@cart = current_customer.cart
		else
			redirect_to new_customer_session_path, alert: "Please sign in to access your cart." and return
		end
	end
end
