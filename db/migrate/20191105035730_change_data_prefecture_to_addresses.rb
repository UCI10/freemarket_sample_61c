class ChangeDataPrefectureToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :prefecture,  :integer
  end
end
