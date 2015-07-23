require 'rubygems'
require 'minitest/autorun'
require 'vcr'

VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/vcr_cassettes'
      c.hook_into :webmock # or :fakeweb
end

class VCRTest < MiniTest::Test
    def test_example_dot_com
          VCR.use_cassette('synopsis') do
            response = Net::HTTP.get_response(URI('http://maps.google.com/maps/api/js?v=3.13&amp;sensor=false&amp;libraries=geometryvar'))
                        assert_match /var modules/, response.body
                            end
            end
end

