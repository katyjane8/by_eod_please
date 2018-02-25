require 'rails_helper'

describe "PM signs up for account" do
  context "they visit the root page" do
    context "they click on the registration link" do
      context "they fill in registration form" do
        it "a new PM account is created" do
          visit '/'

          click_on "Sign Up"

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: 'katy'
          fill_in "user[password]",  with: 'password'

          click_on "Create PM"

          expect(current_path).to eq(admin_dashboard_index_path)
          expect(page).to have_content("Welcome PM!")
        end
      end
    end
  end
end
