class UpdatePriceAttribute < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision: 6, scale: 2
  end
end
