# Load the rails application
require File.expand_path('../application', __FILE__)

ENV["REDISTOGO_URL"] = 'redis://redistogo:58868c345d4b3d15d08fcd816b55afa4@grideye.redistogo.com:10332/'

# Initialize the rails application
Shortener::Application.initialize!
