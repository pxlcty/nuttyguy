ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
	permit_params :title, :description, :specs, :sku, :price, :image

	show do |product|
		attributes_table do
			row :image do
				image_tag product.image.url(:thumb)
			end
			row :title
			row :sku
			row :price
			row :description
			row :specs
		end
		active_admin_comments
	end

	form html: { enctype: "multipart/form-data" } do |f|
		f.inputs "Product Details" do
			f.input :title
			f.input :sku, label: "SKU", hint: "A unique SKU for this product. Very important!"
			f.input :image, as: :file
			f.input :price, as: :string
			f.input :description
			f.input :specs
		end
		f.actions
	end


end
