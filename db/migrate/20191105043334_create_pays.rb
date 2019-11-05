class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.integer     :user_id,         null: false, foreign_key: true  
      t.integer     :card_id,         null: false
      t.string     :customer_id
      t.references  :user,            null: false, foreign_key: true, on_delete: :cascade

 
      t.timestamps
    end
  end
end
