class Product < ActiveRecord::Base
	#Validations :
		validates :title, :sku, :price, presence: true
		validates :price, numericality: true
end
