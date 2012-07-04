require 'spec_helper'

feature "Creating Tickets" do
  before do
    sign_in_as! create(:admin_user)
    create(:project, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Ticket"
  end

  scenario "Creating a ticket" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "My pages are ugly!"
    click_button "Save Ticket"
    page.should have_content("Ticket has been created.")
  end

  scenario "Creating a ticket without valid attributes fails" do
    click_button "Save Ticket"
    page.should have_content("Ticket has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "it sucks"
    click_button "Save Ticket"
    page.should have_content("Ticket has not been created.")
    page.should have_content("Description is too short")
  end

end


feature "Viewing tickets" do
  before do
    textmate_2 = create(:project, :name => "TextMate 2")
    create(:ticket,
            :project => textmate_2,
            :title => "Make it shiny!",
            :description => "Gradients! Starbursts! Oh my!")

    internet_explorer = create(:project, :name => "Internet Explorer")
    create(:ticket,
            :project => internet_explorer,
            :title => "Standards compliance",
            :description => "Isn't a joke.")

    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link "TextMate 2"
    page.should have_content("Make it shiny!")
    page.should_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do 
      page.should have_content("Make it shiny!")
    end
    page.should have_content("Gradients! Starbursts! Oh my!")
  end
end


feature "Editing tickets" do
  let!(:project) { create(:project) }
  let!(:ticket) { create(:ticket, :project => project) }

  before do
    sign_in_as! create(:admin_user)
    visit '/'
    click_link project.name
    click_link ticket.title
    click_link "Edit Ticket"
  end

  scenario "Updating a ticket" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Save Ticket"
    page.should have_content "Ticket has been updated."
    within("#ticket h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content ticket.title
  end

  scenario "Updating a ticket with invalid information" do
    fill_in "Title", :with => ""
    click_button "Save Ticket"
    page.should have_content("Ticket has not been updated.")
  end
end