require 'rails_helper'

RSpec.describe MedianRent, :type => :model do
  it { should belong_to :zip_code }

  it { should validate_presence_of :as_of }
  it { should validate_presence_of :rent }

  describe "min and max rent" do
    before do
      create(:median_rent, rent:1000)
      create(:median_rent, rent:2000)
      create(:median_rent, rent:500)
      create(:median_rent, rent:1500)
    end
    it "returns the max rent" do
      expect(MedianRent.max_rent).to eq(2000)
    end
    it "return the min rent" do
      expect(MedianRent.min_rent).to eq(500)
    end
  end

  describe "assigning ranks" do
    before do
      (1..8).each { |r| create(:median_rent, rent:r*1000) }
    end
    it "ranks according to rent price" do
      first = MedianRent.find_by(rent:1000)
      MedianRent.assign_ranks!
      expect(first.reload.rank).to eq(1)
    end
  end

end
