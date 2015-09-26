class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.integer :project_id
      t.integer :money
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :favs, :users
  end
end
