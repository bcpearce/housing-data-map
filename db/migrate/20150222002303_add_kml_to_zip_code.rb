class AddKmlToZipCode < ActiveRecord::Migration
  def change
    add_column :zip_codes, :kml, :text
  end
end
