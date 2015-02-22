class ZipCode < ActiveRecord::Base
  validates :code, format: { with: RubyRegex::ZIPCode }
  validates :code, presence:true
  validates :kml, presence:true
end
