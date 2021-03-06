module QuandlData

  API_BASE = "http://www.quandl.com/api/v1/datasets/ZILLOW/"

  def self.get_median_rents_by_zip(zip, fmt="json")
    url = "#{API_BASE}RZIP_MEDIANRENTALPRICE_ALLHOMES_#{zip}.#{fmt.to_s}"
    options = { params:{ auth_token:ENV["QUANDL_API_KEY"] } }
    JSON.parse(RestClient.get(url, options))["data"]
  end

end
