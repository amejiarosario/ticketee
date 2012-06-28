Feature: Creating tickets
  In order to assign tickets to projects
  As a user
  I want to be able to add tickets to the selected projects

	Background:
		Given there is a project called "Internet Explorer"
		And there are the following users:
		 | email             | password |
		 | user@ticketee.com | password |
		And I am on the homepage
		When I follow "Internet Explorer"
		And I follow "New Ticket"
		Then I should see "You need to sign in or sign up before continuing"
		When I fill in "Email" with "user@ticketee.com"
		And I fill in "Password" with "password"
		And I press "Sign in"
		Then I should see "New Ticket"

  Scenario: Creating a ticket
    When I fill in "Title" with "Non-standards compliance"	
    And I fill in "Description" with "My pages are ugly"
		And I create the ticket
		Then I should see "Ticket has been created"
		And I should see "Created by user@ticketee.com"
		
	Scenario: Create a ticket with invalid attributes
	  When I create the ticket
	  Then I should see "Ticket has not been created."
		And I should see "Title can't be blank"
		And I should see "Description can't be blank"
		
	Scenario: Description should not be more than 10 characters long
		When I fill in "Title" with "Non-standards compliance"
		And I fill in "Description" with "It sucks!"
		And I create the ticket
		Then I should see "Ticket has not been created"
		And I should see "Description is too short"
