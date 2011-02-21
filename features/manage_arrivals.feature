Feature: Manage Arrivals
  In order to keep my arrivals list up to date
  As a driver/administrator
  I want to add, edit, delete arrivals

  Scenario: Create arrival
    Given there are no arrivals
    When I create an arrival with:
      | Name   | Richard |
      | Flight | UA 123  |
      | From   | PHX     |
      | Time   | 2:38pm  |
    Then there should be 1 arrival with:
      | Name    | Flight | From | Time   |
      | Richard | UA 123 | PHX  | 2:38pm |