Feature: Check location selection page

	@ios @temp 
	Scenario: Check filter results while typing on keyboard
		Given I am logged in
		When I move to location selection page
		Then I see 'Sunrise Blvd' in location list
		When I want to type in filter field
		When I type text 'rise'
		Then I see 'Sunrise Blvd' in location list
		When I type text ' blvd'
		Then I see 'Sunrise Blvd' in location list
		When I type text 'd'
		Then I don't see 'Sunrise Blvd' in location list
		When I erase one char
		Then I see 'Sunrise Blvd' in location list
