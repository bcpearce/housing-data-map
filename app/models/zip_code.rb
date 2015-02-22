class ZipCode < ActiveRecord::Base
  validates :code, format: { with: RubyRegex::ZIPCode }
  validates :code, presence:true
  validates :kml, presence:true

  has_many :median_rents

  def get_rent_data
    med_rent_data = QuandlData.get_median_rents_by_zip(self.code)
    med_rent_data.map do |mrd|
      mr = MedianRent.new(
          zip_code_id:self.id, as_of:Date.parse(mrd[0]), rent:mrd[1])
    end
  end

  def get_rent_data!
    self.get_rent_data.each { |x| x.save }
  end
end
