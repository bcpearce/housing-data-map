class ZipCodesController < ApplicationController
  def show
    @zip_code = ZipCode.find(params[:id])
  end

  def index
    @zip_codes = ZipCode.all
  end
end
