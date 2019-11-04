class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references  :user,            null: false, foreign_key: true, on_delete: :cascade
      t.integer     :postalcode,      null: false
      t.string      :prefecture,     null: false
      t.string      :city,  null:false
      t.string      :house_number,    null:false
      t.string      :building_name     
      t.timestamps
    end

  end
end
