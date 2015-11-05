class Product < ActiveRecord::Base
#Validations :
		validates :title, :sku, :price, presence: true
		validates :price, numericality: true

		has_and_belongs_to_many :carts

#gems :
		has_attached_file :image, styles: { medium: "700x900>", thumb: "120x90>" }, default_url: "/images/:style/missing.png"
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

		#friendly_id
		extend FriendlyId
		friendly_id :title, use: [:slugged, :finders]
end
