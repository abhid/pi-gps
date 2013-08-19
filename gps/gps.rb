require './gps/nmeaparser.rb'
require './gps/serialparser.rb'

class GPS
  attr_accessor :location, :serial_port, :satellites

  def initialize(device_path)
    @serial_port =  SerialPort.new(device_path, 19200, 8, 1, SerialPort::NONE)
    @location = GPSLocation.new
    
    Thread.new do
      self.parseNMEA
    end
  end

  def parseNMEA
    while true
      line = SerialParser::getline(@serial_port)

      case line.split(",")[0]
      when "$GPGGA"
        sentence = NMEAParser::parseGPGGA(line)
        @location.latitude = sentence[2] + sentence[3]
        @location.longitude = sentence[4] + sentence[5]
      when "$GPGSA"
        
      when "$GPRMC"
        
      when "$GPVTG"
        
      when "$GPGSV"
        
      when "$GPTXT"
        # Ignore these sentences
      else
        
      end
    end
  end
end


class GPSLocation
  attr_accessor :latitude, :longitude
  
  def initialize
    @latitude = "0.0N"
    @longitude = "0.0W"
  end
  
  def to_s
    @latitude + ", " + @longitude
  end
end
