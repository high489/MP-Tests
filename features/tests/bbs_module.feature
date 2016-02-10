Feature: Check BBS module

	@ios @feature/MPS-4
	Scenario: Check BBS 'report data by' field
		Given I am logged in
		When I move to BBS list page
		When I create new person observation
		Then I see current user as observer
		When I change 'report data by' value to 'Other'
		Then I don't see observer type buttons
		When I change 'report data by' value to 'Observer'
		Then I see current user as observer



