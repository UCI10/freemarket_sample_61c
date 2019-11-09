class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :category_id,:bigint, null: true # null: trueを明示する必要がある
  end
end
