@wip
Feature: Viewing tickets
  In order to view the tickets for projects
  As a user
  I want to see them on the projects' page

  Background:
		Given there is a project called "TextMate"
		And that project has a ticket:
		 | title          | description           |
		 | Make it shiny! | Gradients! Starburst! |
		And there is a project called "Internet Explorer"
		And that ticket project has a ticket:
		 | title          | description             |
		 | Non-compilance | Y U No follow the rulz? |
		And I am on the homepage
		
	Scenario: Viewing the tickets for a given project
	  When I follow "TextMate"
	  Then I should see "Make it shiny!"
		And I should not see "Non-compilance"
		When I follow "Make it shiny"
		Then I should see "Make it Shiny" within "#ticket h2"
		And I should see "Gradients! Starburst!"
		
	  When I follow "Ticketee"
		And I follow "Internet Explorer"
	  Then I should see "Non-compilance"
		And I should not see "Make it shiny"
		When I follow "Non-compilance"
		Then I should see "Non-compilance" within "#ticket h2"
		And I should see "Y U No follow the rulz?"
