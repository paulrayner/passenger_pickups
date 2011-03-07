Feature: Flight status service
  In order to show my users up-to-date flight information
  As an application
  I want a service with flight status information

  Background:
    Given the following flights in the flight status system:
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
      | Flight Number  | WN 4569 |
      | From           | ERW     |
      | Scheduled Date | today   |
      | Scheduled Time | 12:15pm |
      | Current Date   | today   |
      | Current Time   | 12:30pm |
      | Status         | Delayed |

  Scenario: Details for the same flight tomorrow
    When I request status for tomorrow's flight WN 4569 from ERW
    Then I should receive the following flight details
      | Flight Number  | WN 4569  |
      | From           | ERW      |
      | Scheduled Date | tomorrow |
      | Scheduled Time | 12:15pm  |
      | Current Date   | tomorrow |
      | Current Time   | 12:15pm  |
      | Status         | On Time  |

  Scenario: Details for a different flight today
    When I request status for today's flight DL 123 from SLC
    Then I should receive the following flight details
      | Flight Number  | DL 123  |
      | From           | SLC     |
      | Scheduled Date | today   |
      | Scheduled Time | 10:23am |
      | Current Date   | today   |
      | Current Time   | 10:23am |
      | Status         | On Time |

  Scenario: Delay a flight
    Given the arrival time for today's flight DL 123 from SLC has been delayed to 11:00am
    When I request status for today's flight DL 123 from SLC
    Then I should receive the following flight details
      | Flight Number  | DL 123  |
      | From           | SLC     |
      | Scheduled Date | today   |
      | Scheduled Time | 10:23am |
      | Current Date   | today   |
      | Current Time   | 11:00am |
      | Status         | Delayed |