Feature: Check login page

	Scenario: Check valid login
		Given I am on the login screen
		When I try to login as valid user
		Then I am on main app page



