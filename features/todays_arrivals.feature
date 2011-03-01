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

  Scenario: Display multiple arrivals, but only today's
    Given the following arrivals:
      | Name    | Flight | From | Date     | Time   |
      | Richard | UA 123 | PHX  | today    | 2:38pm |
      | Jane    | BA 219 | LHR  | tomorrow | 5:20pm |
      | Paul    | BA 219 | LHR  | today    | 5:20pm |
    When I view today's arrivals
    Then I should see the following:
      | Name    | Flight | From |
      | Richard | UA 123 | PHX  |
      | Paul    | BA 219 | LHR  |

  Scenario: Flight delay
    Given the following arrival:
      | Name    | Flight | From | Date  | Time   |
      | Richard | UA 123 | PHX  | today | 2:38pm |
    And the arrival time has been delayed to 3:10pm
    When I view today's arrivals
    Then I should see the following:
      | Name    | Flight | From | Scheduled Time | Status  | Actual Time |
      | Richard | UA 123 | PHX  | 2:38pm         | Delayed | 3:10pm      |