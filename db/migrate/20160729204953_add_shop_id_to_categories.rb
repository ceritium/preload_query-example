class AddShopIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :shop_id, :integer
  end
end
