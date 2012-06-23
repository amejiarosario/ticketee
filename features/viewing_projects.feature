Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

	Scenario: Listing all projects
	  Given there is a project called "TextMate"
	  When I'm on the homepage
	  Then I should be able to enter the page for "TextMate"