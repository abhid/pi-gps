require './gps.rb'
require 'sinatra'

set :bind, '0.0.0.0'

@@gps = GPS.new

get '/' do
  @gps = @@gps
  haml :index, :format => :html5
end

