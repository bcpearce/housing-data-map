class MedianRent < ActiveRecord::Base
  validates :rent, presence:true
  validates :as_of, presence:true

  belongs_to :zip_code
end
