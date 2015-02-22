class AddRankToMedianRent < ActiveRecord::Migration
  def change
    add_column :median_rents, :rank, :integer
  end
end
