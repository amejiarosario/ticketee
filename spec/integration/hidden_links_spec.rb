require 'spec_helper'

feature "hidden links" do
  let(:user) { create(:confirmed_user) }
  let(:admin) { create(:admin_user) }
  let(:project) { create(:project) }

  %w|New Edit Delete|.each do |action|
	  context "anonymous users - #{action}" do
	    scenario "cannot see the #{action} Project link" do
	      visit_project action
	      assert_no_link_for "#{action} Project"
	    end
	  end

	  context "regular users - #{action}" do
	    before { sign_in_as!(user) }
	    scenario "cannot see the #{action} Project link" do
	      visit_project action
	      assert_no_link_for "#{action} Project"
	    end
	  end

	  context "admin users - #{action}" do
	    before { sign_in_as!(admin) }
	    scenario "can see the #{action} Project link" do
	      visit_project action
	      assert_link_for "#{action} Project"
	    end
	  end
	end

	def visit_project(action)
    if action == "New"
    	visit '/'
  	else
  		visit project_path(project)
  	end		
	end
end