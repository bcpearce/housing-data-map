require 'rails_helper'

RSpec.describe ZipCode, :type => :model do
  it { should allow_value("10001").for(:code) }
  it { should_not allow_value("111111").for(:code) }
  it { should_not allow_value("1111").for(:code) }
  it { should_not allow_value("abcde").for(:code) }
end
