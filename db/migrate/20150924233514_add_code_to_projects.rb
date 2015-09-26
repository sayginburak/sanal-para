class AddCodeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :code, :integer
  end
end
