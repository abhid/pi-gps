require './nmeaparser.rb'
require './serialparser.rb'

class GPS
  attr_accessor :location, :serial_port

  @serial_port
  @location
  @satellites

  def initialize
    @serial_port =  SerialPort.new("/dev/ttyAMA0", 19200, 8, 1, SerialPort::NONE)
    Thread.new do
      self.parseNMEA
    end
  end

  def parseNMEA
    while true
      line = SerialParser::getline(@serial_port)

      case line.split(",")[0]
      when "$GPGGA"
        @location = NMEAParser::parseGPGGA(line)
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
