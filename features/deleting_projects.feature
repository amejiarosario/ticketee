Feature: Deleting projects
  In order to remove projects
  As a project manager
  I want to make them disappear

	Scenario: Deleting a project
	  Given there is a project called "TextMate"
	  When I delete the project
	  Then I should see "Project has been deleted."