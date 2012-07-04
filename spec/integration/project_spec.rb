require 'spec_helper'

#scenario Project do
feature 'Creating Projects', %q{
	  In order assign tickets to projects
	  As a user
	  I want to create projects		
	} do 
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

feature 'Viewing projects', %q{
	  In order to assign tickets to a project
	  As a user
	  I want to be able to see a list of available projects
	} do
	let!(:user) { create(:confirmed_user) }
	let!(:project) { create(:project) }
	let!(:project_2) { create(:project, name: "Internet Explorer")}

	before do
		sign_in_as! user
	end

	scenario "List all projects #index" do
		visit '/'
		page.should have_content project.name
		page.should have_content project_2.name
	end

	scenario "List project detail #show" do
		visit '/'
		click_link project.name
		page.should_not have_content project_2.name
	end
end

feature 'Editing Projects' do
	before do
		sign_in_as!(create(:admin_user))
		create(:project, name: 'TextMate')
		visit '/'
		click_link 'TextMate'
		click_link 'Edit Project'
	end

	scenario "Updating a project" do
		fill_in 'Name', with: 'TextMate 2 Beta'
		click_button "Save Project"
		page.should have_content "Project has been updated." 
	end

	scenario "Updating project with invalid attributes" do
		fill_in 'Name', with: ''
		click_button "Save Project"
		page.should have_content "Project has not been updated." 			
	end

end

feature "Deleting projects", %q{
	  In order to remove projects
	  As a project manager
	  I want to make them disappear		
	} do
	
	before do
		sign_in_as!(create(:admin_user))
	end

	scenario "Deleting a project" do
		create(:project, name: 'TextMate')
		visit "/"
		click_link 'TextMate'
		click_link 'Delete Project'
		page.should have_content "Project has been deleted."

		visit '/'
		page.should_not have_content 'TextMate'
	end
end
#end