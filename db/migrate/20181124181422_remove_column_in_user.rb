class RemoveColumnInUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cheer_count
  end
end
