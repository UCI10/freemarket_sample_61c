class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references  :user,            null: false, foreign_key: true, on_delete: :cascade
      t.integer     :card_id,         null: false
      t.integer     :year,            null: false
      t.integer     :month,           null: false
      t.integer     :security_code, null: false

      t.timestamps
    end
  end
end
