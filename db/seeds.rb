# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

ZipCode.delete_all

# get the data from the zip code json file for NYC
zips = nil
File.open("#{Rails.root}/public/zips.json") do |f|
  zips = JSON.parse(f.read)
end

# associate the codes with a new ZipCode ActiveModel object
zips_for_insert = zips.map { |z| ZipCode.new(code:z) }

# read the csv data from google's New York State Zipcode file with *.kml data
csv_data = CSV.new(File.read("#{Rails.root}/public/New York Zip Codes.csv"),
    headers:true, header_converters: :symbol)
csv_h = csv_data.to_a.map { |row| row.to_hash }

# find associated kml data and add it to the ActiveModel object
zips_for_insert.each do |z|
  entry = csv_h.find { |i| i[:zip_code] == z.code.to_s }
  z.kml = entry[:geometry] if entry
end

# save to the database
if ZipCode.import zips_for_insert
  puts "ZIP Codes successfully imported"
end
