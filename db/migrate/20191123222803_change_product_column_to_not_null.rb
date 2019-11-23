class ChangeProductColumnToNotNull < ActiveRecord::Migration[5.2]
  def change

    change_column :products, :title,:string, null: false
    change_column :products, :description,:text, null: false
    change_column :products, :condition,:integer, null: false
    change_column :products, :shipping_burden,:integer, null: false
    change_column :products, :shipping_area,:integer, null: false
    change_column :products, :shipping_period,:integer, null: false
    change_column :products, :shipping_method,:integer, null: false
    change_column :products, :price,:integer, null: false
    change_column :products, :size,:integer, null: false

  end

  def down

    change_column :products, :title,:string
    change_column :products, :description,:string
    change_column :products, :condition,:integer
    change_column :products, :shipping_burden,:integer
    change_column :products, :shipping_area,:integer
    change_column :products, :shipping_period,:integer
    change_column :products, :shipping_method,:integer
    change_column :products, :price,:integer
    change_column :products, :size,:integer 

  end
end
