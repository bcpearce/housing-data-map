require 'rails_helper'

RSpec.describe MedianRent, :type => :model do
  it { should belong_to :zip_code }

  it { should validate_presence_of :as_of }
  it { should validate_presence_of :rent }
end
