Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
		Given there are the following users:
		 | email             | password |
		 | user@ticketee.com | password |
		And I am signed in as them
		Given there is a project called "TextMate"
		And "user@ticketee.com" has created a ticket for this project:
		 | title         | description         |
		 | make it shiny | gradients and stuff |
		Given I am on the homepage
		When I follow "TextMate"
		And I follow "make it shiny"
		
	Scenario: Deleting a ticket
	  When I follow "Delete Ticket"
	  Then I should see "Ticket has been deleted."
		And I should be on the project page for "TextMate"
		
