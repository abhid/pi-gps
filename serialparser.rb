require 'serialport'

class SerialParser
  def self.getline(serial)
    start_char = "$"
    end_char = "\r"

    output = ""

    while true
      char = serial.getc
      if char == start_char
        output += char
        break
      end
    end

    while true
      char = serial.getc
      if char == end_char
        break
      end
      output += char unless char.nil?
    end

    return output
  end
end
