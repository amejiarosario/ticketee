Feature: Hidden Links
	In otrder to clean up the user experience
	As the system
	I want to hide links that are not allowed given the user permissions

	Background:
		Given there are the following users:
      | email              | password | admin |
      | user@ticketee.com  | password | false |
      | admin@ticketee.com | password | true  |
    And there is a project called "TextMate 2"

	Scenario: New project link is hidden for non-signed-in users
		Given I am on the homepage
		Then I should not see the "New Project" link

	Scenario: New project link is hidden for non-admin users
		Given I am signed in as "user@ticketee.com"
		Then I should not see the "New Project" link

	Scenario: New project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		Then I should see the "New Project" link
