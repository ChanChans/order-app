class AddAdminIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :admin_id, :integer
  end
end
