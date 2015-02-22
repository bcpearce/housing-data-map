require 'rails_helper'

RSpec.describe ZipCode, :type => :model do
  it { should allow_value("10001").for(:code) }
  it { should_not allow_value("111111").for(:code) }
  it { should_not allow_value("1111").for(:code) }
  it { should_not allow_value("abcde").for(:code) }
  it { should validate_presence_of :code }

  it { should validate_presence_of :kml }

  it { should have_many :median_rents }

  it "has a valid factory" do
    expect(build(:zip_code)).to be_valid
  end

  it "has an invalid factory" do
    expect(build(:invalid_zip_code)).to_not be_valid
  end

  describe "#get_rent_data!", :vcr do
    let(:zip_code) { create(:zip_code) }
    it "creates new entries of MedianRent" do
      expect{zip_code.get_rent_data!}.to change{ MedianRent.count }
    end
    it "creates new entries with a reference to itself" do
      zip_code.get_rent_data!
      MedianRent.all.each { |mr| expect(mr.zip_code).to eq(zip_code) }
    end
  end
end
