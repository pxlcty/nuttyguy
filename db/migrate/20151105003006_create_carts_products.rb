class CreateCartsProducts < ActiveRecord::Migration
  def change
    create_table :carts_products do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
    end
  end
end
