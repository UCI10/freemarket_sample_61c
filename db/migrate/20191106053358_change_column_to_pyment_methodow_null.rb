class ChangeColumnToPymentMethodowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :payment_method,:string, null: true
  end
end
