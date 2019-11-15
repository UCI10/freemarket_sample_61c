class ChangeDatatypeProductBrandString < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :brand
    add_column    :products, :brand_id, :integer
  end
end
