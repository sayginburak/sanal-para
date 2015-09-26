class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :investments, :users
  end
end
