When /^I create a new project called "(.*?)"$/ do |project_name|
  click_link "New Project"
  fill_in "Name", with: project_name
  click_button "Save Project"
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end

Given /^there is a project called "(.*?)"$/ do |project_name|
  FactoryGirl.create(:project, name: project_name)
  visit '/'
  page.should have_content(project_name)
end

Then /^I should be able to enter the page for "(.*?)"$/ do |project_name|
  click_on project_name
  page.should have_content project_name
end

When /^I change the name from "(.*?)" to "(.*?)"$/ do |project_name, new_project_name|
  click_link project_name
  page.should have_content project_name
  click_on "Edit Project"
  fill_in "Name", with: new_project_name
  click_button "Save Project"
  page.should have_content new_project_name  
end
