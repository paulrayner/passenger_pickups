Feature: Flight change notification
  In order to pickup my passengers at the right time
  As a driver
  I want to be notified when their arrival time changes

  Scenario: Delayed flight
    Given the following arrival:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |
    When the arrival time is delayed to 3:10pm
    Then I should receive an email notification with the new flight information