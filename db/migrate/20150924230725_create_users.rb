class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :pin
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
