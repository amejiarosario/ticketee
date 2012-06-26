require 'spec_helper'

describe ProjectsController do
  it "displays an error for missing projects" do
    get :show, id: 'not-found'
    response.should redirect_to projects_path
    message = "The project you were looking for does not exist"
    flash[:alert].should eql message
  end

end
