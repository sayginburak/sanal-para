class AddInvestmentIdToFavs < ActiveRecord::Migration
  def change
    add_reference :favs, :investment, index: true
    add_foreign_key :favs, :investments
  end
end
