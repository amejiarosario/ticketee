require 'spec_helper'

feature 'Signing up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", :with => "user@ticketee.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    page.should have_content "You have signed up successfully." 
  end
end

feature 'Signing in' do
  before do
    create(:user, :email => "ticketee@example.com")
  end

  scenario 'Signing in via confirmation' do
    open_email "ticketee@example.com", :with_subject => /Confirmation/
    click_first_link_in_email
    page.should have_content "Your account was successfully confirmed"
    page.should have_content "Signed in as ticketee@example.com"
  end

  scenario 'Signing in via form' do
	  User.find_by_email('ticketee@example.com').confirm!
	  visit '/'
	  click_link 'Sign in'
	  fill_in 'Email', :with => "ticketee@example.com"
	  fill_in 'Password', :with => "password"
	  click_button "Sign in"
	  page.should have_content("Signed in successfully.")
	end
end