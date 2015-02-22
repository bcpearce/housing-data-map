# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

zips = nil
File.open("#{Rails.root}/public/zips.json") do |f|
  zips = JSON.parse(f.read)
end

zips_for_insert = zips.map { |z| ZipCode.new(code:z) }

ZipCode.import zips_for_insert
