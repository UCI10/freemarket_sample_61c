class RenamePrefectureColumnToPrefectures < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :prefecture, :prefectures
  end
end
