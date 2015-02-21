class ZipCode < ActiveRecord::Base
  validates :code, format: { with: RubyRegex::ZIPCode }
end
