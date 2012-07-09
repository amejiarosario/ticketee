require 'spec_helper'

describe ProjectsController do
  let(:user){ create_user! }
  let(:project) { mock_model(Project, :id => 1) }
  #let(:project){ create(:project) }

  it "displays an error for missing projects" do
    get :show, id: 'not-found'
    response.should redirect_to projects_path
    message = "The project you were looking for does not exist"
    flash[:alert].should eql message
  end

  context "standard (non-admin) users" do
  	{ "new" => "get",
			"create" => "post",
			"edit" => "get",
			"update" => "put",
			"destroy" => "delete"
		}.each do |action, method|
	  	it "cannot access the #{action} action" do
	  		sign_in(:user, user)
	  		send(method, action.dup, id: project.id)
	  		response.should redirect_to(root_path)
	  		flash[:alert].should == "You must be an admin to do that."
	  	end
	  end

  end
end
