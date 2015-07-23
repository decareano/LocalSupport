require 'vcr'
require 'net/http'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr/cassettes'
  c.hook_into :webmock
end

VCR.insert_cassette('testvcr2', :record => :once) do
  response = Net::HTTP.get_response('localhost', '/', 7777)
  puts "Response: #{response.body}"
end

