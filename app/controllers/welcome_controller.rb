class WelcomeController < ApplicationController

  def home
    redirect_to zip_codes_path
  end
  
end
