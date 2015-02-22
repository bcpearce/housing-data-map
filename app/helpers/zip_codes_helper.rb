module ZipCodesHelper

  def assign_style(zip)
    if !zip.latest_median_rent.nil? && zip.latest_median_rent.rank
      "#Poly#{zip.latest_median_rent.rank}".html_safe
    else
      "#nilPoly".html_safe
    end
  end

end
