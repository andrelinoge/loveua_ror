@javascript

Feature: User regisration
	
	User register via registration form on main page.

	Scenario: User pass first step of registration successfully via registration form
		Given I am a guest
		When I fill registration form with valid data
		Then I should be registred in application
		And logged in
		And redirected to next step of registration

	Scenario: User see validation errors in form of initial regitration if input invalid data
		Given I am a guest
		When I fill registration form with invalid data
		Then I should see validation errors
		And stay on the same page

	Scenario: User complete registration
		Given I am a user
		And I am on complete registration page
		When I fill my personal data
		Then my profile is updated successfully
		When I fill my questionary data

	Scenario: User uploads photos
		Given I am a user
		And I am on complete registration page
		When I upload valid photos
		Then I have all photos in my gallery with thumbnails
		And first photo becomes my avatar
