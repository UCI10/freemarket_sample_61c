class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true      
      t.references :brand, foreign_key: true
      t.string      :title
      t.string      :description
      t.integer     :condition
      t.integer     :shipping_burden
      t.integer     :shipping_area
      t.integer     :shipping_period
      t.integer     :shipping_method
      t.integer     :price   
      t.integer     :size             
      t.integer     :buyer_id           

      t.timestamps
    end
  end
end
