class RemoveUserIdFromFavs < ActiveRecord::Migration
  def change
    remove_column :favs, :user_id, :integer 
  end
end
