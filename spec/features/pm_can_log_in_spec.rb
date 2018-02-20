require 'rails_helper'

describe "project manager can log in to dashboard" do
  it "logs in authorized user" do
    admin = create(:project_manager)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    expect(page).to have_content("Welcome PM!")
  end
end
