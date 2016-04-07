Feature: Checking location selection page

	@ios
	Scenario: Check filter results while typing
		Given I am on the login screen
		When I try to login as valid user
		When I move to location selection page
		Then I see 'Sunrise Blvd' in location list
		When I want to type in filter field
		When I type text 'Rise BlVd'
		Then I see 'Sunrise Blvd' in location list
		When I type text '7'
		Then I don't see 'Sunrise Blvd' in location list
		When I erase one char
		Then I see 'Sunrise Blvd' in location list
