require './gps/gps.rb'
require 'sinatra'

set :bind, '0.0.0.0'

@@gps = GPS.new("/dev/tty.SLAB_USBtoUART") # On Macbook Pro
# @@gps = GPS.new("/dev/ttyAMA0") # On RaspberryPI

get '/' do
  @gps = @@gps
  haml :index, :format => :html5
end