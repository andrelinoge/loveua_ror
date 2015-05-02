@javascript

Feature: User regisration
	
	User register via registration form on main page.

	Scenario: User register successfully via registration form
		Given I am a guest
		When I fill registration form with valid data
		Then I should be registred in application
		And logged in
		And redirected to next step of registration

	Scenario: User see validation errors if input invalid data
		Given I am a guest
		When I fill registration form with invalid data
		Then I should see validation errors
		And stay on the same page
