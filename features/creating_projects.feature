Feature: Creating projects
  In order assign tickets to projects
  As a user
  I want to create projects

	Background:
		Given I'm on the homepage

	Scenario: Create a project called TexMate
	  When I create a new project called "TextMate"
	  Then I should see "Project has been created."
		And I should see "TextMate - Project - Ticketee"
		
	Scenario: Creating a project without name
	  When I create a new project called ""
	  Then I should see "Project has not been created."
		And I should see "Name can't be blank"
	
	
	
	