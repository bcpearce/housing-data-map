module ZipCodesHelper

  COLOR_CODE = { 1 => "00BF03",
                 2 => "00C43A",
                 3 => "00C975",
                 4 => "00CFB2",
                 5 => "00B5D4",
                 6 => "007DDA",
                 7 => "0041DF",
                 8 => "0001E5",
                 0 => "888888"}
  OPACITY = { line:"AA", poly:"70" }

  def assign_style(median_rent)
    if !median_rent.nil? && median_rent.rank
      "#Poly#{median_rent.rank}".html_safe
    else
      "#nilPoly".html_safe
    end
  end

  def zip_color(rank = 0, type="line")
    "#{OPACITY[type]}#{COLOR_CODE[rank]}".html_safe
  end

end
