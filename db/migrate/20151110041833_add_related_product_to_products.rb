class AddRelatedProductToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :related_product, index: true, foreign_key: true
  end
end
