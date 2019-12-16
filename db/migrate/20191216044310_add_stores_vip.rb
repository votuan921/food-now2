class AddStoresVip < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :vip, :integer
  end
end
