class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :admin_id, :integer
  end
end
