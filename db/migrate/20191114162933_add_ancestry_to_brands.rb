class AddAncestryToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :ancestry, :string
    add_index :brands, :ancestry
  end
end
