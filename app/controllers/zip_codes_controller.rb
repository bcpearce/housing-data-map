class ZipCodesController < ApplicationController

  def show
    @zip_code = ZipCode.find(params[:id])
    gon.zip_code_id = @zip_code.id
    gon.date = params[:date]
    respond_to do |format|
      format.html
      format.kml
    end
  end

  def index
    @zip_codes = ZipCode.all.order(:id)
    date = params[:date]
    date ||= MedianRent.available_dates.sort.last
    @median_rents = MedianRent.where(as_of:date)
    gon.is_index = true
    gon.date = params[:date]
    respond_to do |format|
      format.html
      format.kml
    end
  end

end
