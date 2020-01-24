class Changlikestable < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :likeable_id, :integer, null: false
    remove_column :likes, :comment_id
    remove_column :likes, :artwork_id
    add_index :likes, [:user_id, :likeable_id], unique: true
  end
end
