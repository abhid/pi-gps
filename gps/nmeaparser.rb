class NMEAParser

  def self.parseGPGGA(nmea)
    arr = nmea.split(",")
    arr[2] = (arr[2][0...2].to_f + (arr[2][2..-1].to_f / 60.0)).to_s
    arr[4] = (arr[4][0...3].to_f + (arr[4][3..-1].to_f / 60.0)).to_s
    arr
  end

end
