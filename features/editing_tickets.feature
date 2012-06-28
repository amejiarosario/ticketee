Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the tickets

	Background:
		Given there is a project called "TextMate"
		And that project has a ticket:
		 | title         | description |
		 | make it shiny | gradients and stuff   |
		Given I am on the homepage
		When I follow "TextMate"
		And I follow "make it shiny"
		When I follow "Edit Ticket"
		
		Scenario: Updating a ticket
		  When I fill in "Title" with "make it really shiny"
		  And I press "Save Ticket"
			Then I should see "make it really shiny"
			And I should see "make it really shiny" within "#ticket h2"
			But I should not see "make it shiny"
		
		Scenario: Updating a ticket with invalid information
		  When I fill in "Title" with " "
			And I press "Save Ticket"
		  Then I should see "Ticket has not been updated."
			And I should see "Title can't be blank"
