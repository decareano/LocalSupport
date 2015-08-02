require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'features/cassettes'
  c.hook_into :webmock
end

VCR.use_cassette('pinga') do
  Net::HTTP.get_response(URI('http://localhost:3000/features/individual_charity_pages/donation_info.feature'))
end


