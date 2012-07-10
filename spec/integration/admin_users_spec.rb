require 'spec_helper'

feature "Creating Users" do
  let!(:admin) { create(:admin_user) }

  before do
    sign_in_as!(admin)
    visit '/'
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

  scenario 'Creating a new user' do
    fill_in "Email", :with => "newbie@example.com"
    fill_in "Password", :with => "password"
    click_button "Create User"
    page.should have_content("User has been created.")
  end

  scenario "Leaving email blank results in an error" do
    fill_in "Email", :with => ""
    fill_in "Password", :with => "password"
    click_button "Create User"
    page.should have_content("User has not been created.")
    page.should have_content("Email can't be blank")
  end

  scenario "Creating an admin user" do
    fill_in "Email", :with => "admin@example.com"
    fill_in "Password", :with => "password"
    check "Is an admin?"
    click_button "Create User"
    page.should have_content("User has been created")
    within("#users") do
      page.should have_content("admin@example.com (Admin)")
    end
  end  
end


feature 'Editing a user' do
  let!(:admin_user) { create(:admin_user) }
  let!(:user) { create(:confirmed_user) }

  before do
    sign_in_as!(admin_user)
    visit '/'
    click_link "Admin"
    click_link "Users"
    click_link user.email
    click_link "Edit User"
  end

  scenario "Updating a user's details" do
    fill_in "Email", :with => "newguy@example.com"
    click_button "Update User"
    page.should have_content("User has been updated.")
    within("#users") do
      page.should have_content("newguy@example.com")
      page.should_not have_content(user.email)
    end
  end

  scenario "Toggling user's admin ability" do
    check "Is an admin?"
    click_button "Update User"
    page.should have_content("User has been updated.")
    within("#users") do
      page.should have_content("#{user.email} (Admin)")
    end
  end

  scenario "Updating with an invalid email fails" do
    fill_in "Email", :with => "fakefakefake"
    click_button "Update User"
    page.should have_content("User has not been updated")
    page.should have_content("Email is invalid")
  end
end