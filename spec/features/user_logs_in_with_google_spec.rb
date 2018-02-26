require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")

    click_on "Sign in with Google"

    expect(page).to have_content("Katy Welyczko")
    expect(page).to have_link("Logout")
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] =
    OmniAuth::AuthHash.new({
          provider: "google",
          uid: "1234567",
          info: {
            email: "katy.jane8@gmail.com",
            first_name: "Katy",
            last_name: "Welyczko"
          },
          credentials: {
            token: "abcdefg12345",
            refresh_token: "12345abcdefg",
            expires_at: DateTime.now,
          }
    })
end
