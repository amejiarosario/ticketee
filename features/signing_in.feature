Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given the are the following users:	
		 | email      | password |
		 | user@t.tt  | password |
		 | user2@a.jp | password |
		And "user@t.tt" opens the email with subject "Confirmation instructions"
		And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
		And I should see "Signed in as user@t.tt"
		
  
  
  
