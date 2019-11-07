class ChangeImageUrlsToImages < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :image_url,  :text
  end
end
