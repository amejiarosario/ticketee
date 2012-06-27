When /^I create a new project called "(.*?)"$/ do |project_name|
  click_link "New Project"
  fill_in "Name", with: project_name
  click_button "Save Project"
end

# Then /^I should see "(.*?)"$/ do |message|
#   page.should have_content message
# end

# Then /^I should not see "(.*?)"$/ do |message|
#   page.should_not have_content message
# end

Given /^there is a project called "(.*?)"$/ do |project_name|
  @project = FactoryGirl.create(:project, name: project_name)
  visit '/'
  page.should have_content(project_name)
  click_on project_name
  page.should have_content project_name
end

# Then /^I should be able to enter the page for "(.*?)"$/ do |project_name|
#   click_on project_name
#   page.should have_content project_name
# end

When /^I change the name from "(.*?)" to "(.*?)"$/ do |project_name, new_project_name|
  click_on "Edit Project"
  fill_in "Name", with: new_project_name
  click_button "Save Project"
  page.should have_content new_project_name  
end

When /^I delete the project$/ do
  click_on "Delete Project"
end

### Tickets

# Given /^I follow "(.*?)"$/ do |link|
#   click_on link
# end

# When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
#   fill_in arg1, with: arg2
# end

When /^I create the ticket$/ do
  click_on "New Ticket"
  #page.should have_content "Ticket has been created"
end

##

Given /^that project has a ticket:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attr|
    @project.tickets.create!(attr)
  end
end