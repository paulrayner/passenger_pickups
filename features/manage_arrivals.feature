Feature: Manage Arrivals
  In order to keep my arrivals list up to date
  As a driver/administrator
  I want to add, edit, delete arrivals

  Scenario: Create arrival
    Given there are no arrivals
    When I create an arrival with:
      | Name   | Richard   |
      | Flight | UA 123    |
      | From   | PHX       |
      | Date   | 2/28/2011 |
      | Time   | 2:38pm    |
    Then there should be 1 arrival with:
      | Name    | Flight | From | Date      | Time   |
      | Richard | UA 123 | PHX  | 2/28/2011 | 2:38pm |

  Scenario: Modify arrival
    Given the following arrival:
      | Name    | Flight | From | Date      | Time   |
      | Richard | UA 123 | PHX  | 2/28/2011 | 2:38pm |
    When I modify the arrival with:
      | Flight | UA 320 |
      | From   | PHX    |
      | Time   | 1:15pm |
    Then there should be 1 arrival with:
      | Name    | Flight | From | Date      | Time   |
      | Richard | UA 320 | PHX  | 2/28/2011 | 1:15pm |

