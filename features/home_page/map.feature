Feature: Map of local charities
  As a local resident
  So that I can get support for a specific condition
  I want to find contact details for a local service specific to my need
  Tracker story ID: https://www.pivotaltracker.com/story/show/45757075
  Tracker story ID: https://www.pivotaltracker.com/story/show/52317013

  Background:
    Given the following organisations exist:
      | name                           | description                    | address        | postcode | website       |
      | Harrow Bereavement Counselling | Harrow Bereavement Counselling | 34 pinner road | HA1 4HZ  | http://a.com/ |
     

    Given the following users are registered:
      | email                         | password | organisation | confirmed_at         |
      | registered_user-3@example.com | pppppppp | Youth UK     | 2007-01-01  10:00:00 |
 
  @vcr
  @javascript
  Scenario: Show all charities in map on homepage map
    Given I visit the home page
    #And show me the page

    

    Then I should see the following measle markers in the map:
    | Harrow Bereavement Counselling | 

    

 