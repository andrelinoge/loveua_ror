@javascript

Feature: Articles
	Any user may see articles in list and preview mode

	Scenario: User see articles page
		Given I am a guest
		When I visit articles page
		Then I should see title, cover and shor text of articles 
		And I should see pager

	Scenario: User read article
		Given I am a guest
		When I visit articles page
		And click on article title
		Then I should read article  
