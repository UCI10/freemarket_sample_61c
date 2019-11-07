class ChangeDatatypecardIdOfcard < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :card_id, :string
  end
end
