require 'vcr'

require 'net/http'
 
 VCR.configure do |c|
   c.cassette_library_dir = 'cassettes'
     c.stub_with :webmock
     end

     VCR.use_cassette('anotherVCR', :record => :new_episodes) do
       response = Net::HTTP.get_response(URI('http://localhost:3000'))
       end
