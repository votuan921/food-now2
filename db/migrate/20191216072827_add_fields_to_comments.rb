class AddFieldsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :food, :integer
    add_column :comments, :price, :integer
    add_column :comments, :punctuality, :integer
    add_column :comments, :courtesy, :integer
  end
end
