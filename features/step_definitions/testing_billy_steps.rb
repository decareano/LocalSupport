Before('@billy') do
  Capybara.current_driver = :webkit_billy
end


@javascript
@vcr
@billy

And /^a stub for google$/ do
  proxy.stub('http://www.google.com/').and_return(:text => "I'm not Google!")
  visit 'http://www.google.com/'
  page.should have_content("I'm not Google!")
end