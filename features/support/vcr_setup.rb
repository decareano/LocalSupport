require 'vcr'


VCR.configure do |c|
  c.cassette_library_dir = 'features/vcr_cassettes'
  c.hook_into  :webmock
  #c.debug_logger = File.open(ARGV.first, 'w')
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
end

#VCR.cucumber_tags do |t|
 # t.tag '@vcr', :use_scenario_name => true
#end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end