Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
		Given there is a project called "TextMate"
		And that project has a ticket:
			| title | description |
			| make it shiny | do a better product |
		Given I am on the homepage
		When I follow "TextMate"
		And I follow "make it shiny"
		
	Scenario: Deleting a ticket
	  When I follow "Delete Ticket"
	  Then I should see "Ticket has been deleted."
		And I should be on the project page for "TextMate"
		
