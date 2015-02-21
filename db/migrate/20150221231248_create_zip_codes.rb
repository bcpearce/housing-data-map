class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
