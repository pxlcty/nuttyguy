class Product < ActiveRecord::Base
#Validations :
		validates :title, :sku, :price, presence: true
		validates :price, numericality: true

		#has_and_belongs_to_many :carts
		has_many :line_items
		has_many :carts, through: :line_items, source: :itemized, source_type: 'Cart'
		has_many :orders, through: :line_items, source: :itemized, source_type: 'Order'
		belongs_to :related_product, class_name: "Product", foreign_key: "related_product_id"

#gems :
		has_attached_file :image, styles: { medium: "700x900>", thumb: "120x90>" }, default_url: "/images/:style/missing.png"
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

		#friendly_id
		extend FriendlyId
		friendly_id :title, use: [:slugged, :finders]
end
