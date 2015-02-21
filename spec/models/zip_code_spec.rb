require 'rails_helper'

RSpec.describe ZipCode, :type => :model do
  it { should allow_value("10001").for(:code) }
  it { should_not allow_value("111111").for(:code) }
  it { should_not allow_value("1111").for(:code) }
  it { should_not allow_value("abcde").for(:code) }

  it "has a valid factory" do
    expect(build(:zip_code)).to be_valid
  end

  it "has an invalid factory" do
    expect(build(:invalid_zip_code)).to_not be_valid
  end

end
