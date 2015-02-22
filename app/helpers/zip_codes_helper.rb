module ZipCodesHelper

  COLOR_CODE = { 1 => "00BF03",
                 2 => "00C4BC",
                 3 => "00C975",
                 4 => "00CFB2",
                 5 => "00B6D4",
                 6 => "007DDA",
                 7 => "0041DF",
                 8 => "0002E5",
                 0 => "333333"}
  OPACITY = { line:"88", poly:"50" }

  def assign_style(zip)
    if !zip.latest_median_rent.nil? && zip.latest_median_rent.rank
      "#Poly#{zip.latest_median_rent.rank}".html_safe
    else
      "#nilPoly".html_safe
    end
  end

  def zip_color(rank = 0, type="line")
    "#{OPACITY[type]}#{COLOR_CODE[rank]}".html_safe
  end

end
