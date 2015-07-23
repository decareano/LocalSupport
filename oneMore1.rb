require 'rubygems'
require 'minitest/autorun'
require 'vcr'

VCR.configure do |c|
      c.cassette_library_dir = 'fixtures/vcr_cassettes'
          c.hook_into :webmock # or :fakeweb
end



class VCRTest < MiniTest::Test
        def test_example_dot_com
          VCR.use_cassette('map_feature21') do
            response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
            assert_match /Domain Names/, response.body
          end
        end
 end

