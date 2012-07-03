require 'spec_helper'

feature 'Creating Projects' do 
	before do
		sign_in_as! create(:admin_user)
		visit '/'
		click_link 'New Project'
	end

	scenario "can create a project" do
		fill_in 'Name', with: 'TextMate'
		click_button 'Save Project'
		page.should have_content 'Project has been created.'

		project = Project.find_by_name 'TextMate'
		page.current_url.should == project_url(project)
		find("title").should have_content "TextMate - Project - Ticketee"
	end

	scenario "create project without name" do
		click_button 'Save Project'
		page.should have_content 'Project has not been created.'
		page.should have_content("Name can't be blank")
	end
end