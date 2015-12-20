Feature: Check login page

	Scenario Outline: Check wrong login
		Given I am on the login screen
		When I try to login as <Login> with password <Password>
		Then I see invalid <Login> login message window

		Examples:
		| Login					| Password				|
		| 'admin'				| 'granted'				|
		| '123aa45d6'			| '123aa45d6'			|
		| ' Mohbull'			| 'Password2015'		|
		| 'Mohbull '			| 'Password2015'		|
		| 'Mohbull' 			| ' Password2015'		|
		| 'Mohbull' 			| 'Password2015 '		|
		| 'Mohbull' 			| 'Mohbull'				|
		| 'Password2015' 		| 'Password2015'		|
		| '!@#$%^&*(_)-+=:;'	| '!@#$%^&*(_)-+=:;'	|

Scenario: Check wrong login with numbers
  Given I am on the login screen
  When I try to login as 1 with password 1
  Then I see invalid 1 login message window



