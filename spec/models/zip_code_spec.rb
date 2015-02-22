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

  describe "::get_rent_data!", :vcr do
    let(:zip_code1) { create(:zip_code, code:"10001") }
    let(:zip_code2) { create(:zip_code, code:"10010") }

    it "creates new entries of Median rent for all zips" do
      count1 = zip_code1.get_rent_data.count
      count2 = zip_code2.get_rent_data.count
      expect(count1).to be > 0
      expect(count2).to be > 0
      expect{ZipCode.get_rent_data!}.
          to change{ MedianRent.count }.by(count1+count2)
    end
  end

  describe "latest_median_rent", :vcr do
    let(:zip_code) { create(:zip_code, code:"10001") }

    it "returns the most recent median rent data" do
      create(MedianRent, as_of:Date.new(2014, 1, 1), zip_code_id:zip_code.id)
      create(MedianRent, as_of:Date.new(2015, 1, 1), zip_code_id:zip_code.id)
      create(MedianRent, as_of:Date.new(2013, 1, 1), zip_code_id:zip_code.id)
      expect(zip_code.latest_median_rent.as_of).to eq(Date.new(2015, 1, 1))
    end
  end
end
