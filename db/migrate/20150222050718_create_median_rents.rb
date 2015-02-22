class CreateMedianRents < ActiveRecord::Migration
  def change
    create_table :median_rents do |t|
      t.decimal :rent
      t.date :as_of
      t.integer :zip_code_id

      t.timestamps null: false
    end
  end
end
