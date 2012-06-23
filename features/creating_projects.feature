Feature: Creating projects
  In order assign tickets to projects
  As a user
  I want to create projects

	Scenario: Create a project called TexMate
	  Given I'm on the homepage
	  When I create a new project called "TextMate"
	  Then I should see "Project has been created"
		And I should see "TextMate - Project - Ticketee"
	