class AddLongNameToZipCode < ActiveRecord::Migration
  def change
    add_column :zip_codes, :long_name, :string
  end
end
