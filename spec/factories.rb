FactoryGirl.define do
  factory :zip_code do
    code "10001"
  end

  factory :invalid_zip_code, class: ZipCode do
    code "1000"
  end
end
