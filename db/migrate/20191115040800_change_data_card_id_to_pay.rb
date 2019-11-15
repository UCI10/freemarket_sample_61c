class ChangeDataCardIdToPay < ActiveRecord::Migration[5.2]
  def change
    change_column :pays, :card_id, :string
  end
end
