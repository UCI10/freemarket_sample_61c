class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user,null: false, foreign_key: true
      t.references :category,null: false, foreign_key: true      
      t.references :brand, null: false, foreign_key: true
      t.string      :title, null: false
      t.string      :description, null: false
      t.integer     :condition, null: false
      t.integer     :shipping_burden,  null: false
      t.integer     :shipping_area,     null: false
      t.integer     :shipping_period,     null: false
      t.integer     :shipping_method,   null: false
      t.integer     :price,             null: false
      t.integer     :size,              null: false
      t.integer     :buyer_id,         null: false      

      t.timestamps
    end
  end
end
