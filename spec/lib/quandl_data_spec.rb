require 'rails_helper'

describe "quandl_data.rb" do
  describe "get_median_rents_by_zip" do

    it "returns a nested array" do
      expect(QuandlData.get_median_rents_by_zip("10001")).to be_an(Array)
    end
    it "is paired sets of dates and integers" do
      QuandlData.get_median_rents_by_zip("10001").each do |x|
        expect(Date.parse x[0]).to be_a Date
        expect(x[1]).to be_an Numeric
      end
    end

  end
end
