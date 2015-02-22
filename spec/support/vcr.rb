VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
  c.filter_sensitive_data("<QUANDL_API_KEY>") { ENV["QUANDL_API_KEY"] }
end
