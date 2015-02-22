class MedianRent < ActiveRecord::Base
  validates :rent, presence:true
  validates :as_of, presence:true

  belongs_to :zip_code

  def self.max_rent
    MedianRent.order(:rent).last.rent
  end

  def self.min_rent
    MedianRent.order(:rent).first.rent
  end

  def self.assign_ranks!(ranks=8)
    interval = (self.max_rent-self.min_rent)/ranks
    (1..ranks).each do |r|
      mrs = MedianRent.where("rent >= #{min_rent+(r-1)*interval}")
      mrs.update_all(rank: r)
    end
  end
end
