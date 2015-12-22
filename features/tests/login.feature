Feature: Check login page

	Scenario Outline: Check wrong login
		Given I am on the login screen
		When I try to login as <Login> with password <Password>
		Then I see invalid <Login> login message window

		Examples:
		|	 Login				|	Password			|
		|	'mohbull'			|	'Password2015'		|
		|	'Mohbull'			|	'password2015'		|
		|	'Mohbull '			|	'Password2015'		|
		|	'Mohbull'			|	'Password2015 '		|

	Scenario: Check valid login
		Given I am on the login screen
		When I try to login as valid user
		Then I am on main app page



