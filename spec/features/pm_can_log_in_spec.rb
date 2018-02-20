require 'rails_helper'

describe "project manager can log in to dashboard" do
  it "logs in authorized user" do
    project_manager = create(:project_manager)

    visit "/"

    login_as(project_manager)

    expect(page).to have_content("Welcome PM!")
  end
end
