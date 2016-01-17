Feature: Check login page

	@ios @login
	Scenario Outline: Check wrong login
		Given I am on the login screen
		When I try to login as <Login> with password <Password>
		Then I see invalid <Login> login message window

		Examples:
		|	 Login				|	Password			|
		|	'admin'				|	'granted'			|
		|	'123aa45d6'			| 	'123aa45d6'			|
		|	'mohbull'			|	'Password2015'		|
		|	'Mohbull'			|	'password2015'		|
		|	' Mohbull'			|	'Password2015'		|
		|	'Mohbull '			|	'Password2015'		|
		|	'Mohbull'			|	' Password2015'		|
		|	'Mohbull'			|	'Password2015 '		|
		|	'Mohbull'			|	'Password 2015'		|
		|	'Mohbu ll'			|	'Password2015'		|
		|	'Mohbull'			|	'Mohbull'			|
		|	'Password2015'		|	'Password2015'		|
		|	'!@#$%^&*(_)-+=:;'	|	'!@#$%^&*(_)-+=:;'	|

	@ios @login
	Scenario: Check valid login
		Given I am on the login screen
		When I try to login as valid user
		Then I am on main app page



