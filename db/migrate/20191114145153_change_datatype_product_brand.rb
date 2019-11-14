class ChangeDatatypeProductBrand < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :brand
    add_column    :products, :brand, :string
  end
end
