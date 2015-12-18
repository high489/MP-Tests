Feature: Check login

Scenario: Check wrong login
  Given I am on the login screen
  When I try to login as werwerewrwer with password pass
  Then I see invalid werwerewrwer login message window



Scenario: Check wrong login with numbers
  Given I am on the login screen
  When I try to login as 1 with password 1
  Then I see invalid 1 login message window


