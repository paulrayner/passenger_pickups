Feature: Today's Arrivals
  In order to pick up passengers at the right times
  As a car service driver
  I want to see today's arrivals

  Scenario: Display first arrival information
    When I view today's arrivals
    Then I should see the following:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |