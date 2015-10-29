class ProductsController < ApplicationController
	def index
		@get_nutty = true
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@title = @product.title
	end
end
