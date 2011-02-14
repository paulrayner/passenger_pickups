Feature: Today's Arrivals
  In order to pick up passengers at the right times
  As a car service driver
  I want to see today's arrivals

  Scenario: Display first arrival information
    Given the following arrival:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |
    When I view today's arrivals
    Then I should see the following:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |


  Scenario: Display multiple arrivals
    Given the following arrivals:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |
      | Paul    | BA 219 | LHR  | 5:20pm |
    When I view today's arrivals
    Then I should see the following:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |
      | Paul    | BA 219 | LHR  | 5:20pm |
