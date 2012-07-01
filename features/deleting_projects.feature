Feature: Deleting projects
  In order to remove projects
  As a project manager
  I want to make them disappear

	Background:
		Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
		And I am signed in as them

	Scenario: Deleting a project
	  Given there is a project called "TextMate"
	  When I delete the project
	  Then I should see "Project has been deleted."