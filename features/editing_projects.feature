Feature: Editing projects
  In order to update project information
  As a user
  I want to be able to do that through the interface

	Background:
		Given there is a project called "TextMate"

  Scenario: Updating a project
    When I change the name from "TextMate" to "Vi Editor"
    Then I should see "Project has been updated."
  	And I should see "Vi Editor - Project - Ticketee"

	Scenario: Updating project with invalid params
  	When I change the name from "TextMate" to ""
  	Then I should see "Project has not been updated."

	
	
	
  
  
