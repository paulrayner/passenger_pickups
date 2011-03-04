@current
Feature: Flight status service
  In order to show my users up-to-date flight information
  As an application
  I want a service with flight status information

  Background:
    Given the following flights:
      | Flight Number | From | Scheduled Date | Scheduled Time | Current Date | Current Time | Status  |
      | DL 123        | SLC  | today          | 10:23am        | today        | 10:23am      | On Time |
      | WN 4569       | ERW  | today          | 12:15pm        | today        | 12:30pm      | Delayed |
      | WN 4569       | ERW  | tomorrow       | 12:15pm        | tomorrow     | 12:15pm      | On Time |
      | F9 781        | ORD  | today          | 3:45pm         |              |              | Canceled|
      | F9 781        | ORD  | yesterday      | 3:45pm         | yesterday    | 3:45pm       | Landed  |
      | BA 219        | LHR  | yesterday      | 5:20pm         | yesterday    | 5:27pm       | Landed  |

  Scenario: Get status of all flights
    When I request status for all flights
    Then I should receive status for 6 flights
    
  Scenario: Details for a single flight today
    When I request status for today's flight WN 4569 from ERW
    Then I should receive the following flight details
      | Flight Number | From | Scheduled Date | Scheduled Time | Current Date | Current Time | Status  |
      | WN 4569       | ERW  | today          | 12:15pm        | today        | 12:30pm      | Delayed |

  Scenario: Details for the same flight tomorrow
    When I request status for tomorrow's flight WN 4569 from ERW
    Then I should receive the following flight details
      | Flight Number | From | Scheduled Date | Scheduled Time | Current Date | Current Time | Status  |
      | WN 4569       | ERW  | tomorrow       | 12:15pm        | tomorrow     | 12:15pm      | On Time |

  Scenario: Details for a different flight today
    When I request status for today's flight DL 123 from SLC
    Then I should receive the following flight details
      | Flight Number | From | Scheduled Date | Scheduled Time | Current Date | Current Time | Status  |
      | DL 123        | SLC  | today          | 10:23am        | today        | 10:23am      | On Time |
