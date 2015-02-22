NYC Housing Data Map
====================

This application is intended to show housing data mapped for NYC.

Currently it only shows median rent by zip code.

Data
-----
Data is acquired by hooking into the databases at http://quandl.com.  While a Quandl API key is not required for seeding the database, you may be locked out for too many calls without one.

Save your Quandl API key in an environment variable
```
ENV["QUANDL_API_KEY"] = <quandl_api_key>
```
and run the task
```
rake db:seed
```
to populate the database with ZIP Codes.

Enter the rails console and run the function
```
 > ZipCode.get_rent_data!
```
to populate the MedianRent database.

Testing
-------
Tests are run through RSpec.  Tests that hook into Quandl's databases are mocked using VCR.  
