class ZipCode < ActiveRecord::Base
  validates :code, format: { with: RubyRegex::ZIPCode }
  validates :code, presence:true
  validates :kml, presence:true

  has_many :median_rents

  def self.get_rent_data
    self.all.map { |x| x.get_rent_data }
  end

  def self.get_rent_data!
    self.all.map { |x| x.get_rent_data! }
  end

  def latest_median_rent
    self.median_rents.sort_by{ |mr| mr.as_of }.last
  end

  def get_rent_data
    med_rent_data = QuandlData.get_median_rents_by_zip(self.code)
    sleep(0.1)
    med_rent_data.map do |mrd|
      mr = MedianRent.new(
          zip_code_id:self.id, as_of:Date.parse(mrd[0]), rent:mrd[1])
    end
  rescue RestClient::ResourceNotFound
  end

  def get_rent_data!
    MedianRent.import self.get_rent_data
  rescue ArgumentError
  end

  def add_long_name!
    if self.code
      self.long_name =
          Geocoder.search(10010).first.address_components[1]["long_name"]
      self.save
    end
  end

end
