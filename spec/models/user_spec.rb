require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
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
        expires_at: DateTime.now
      }
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("google")
    expect(new_user.uid).to eq("1234567")
    expect(new_user.email).to eq("katy.jane8@gmail.com")
    expect(new_user.first_name).to eq("Katy")
    expect(new_user.last_name).to eq("Welyczko")
    expect(new_user.token).to eq("abcdefg12345")
    expect(new_user.refresh_token).to eq("12345abcdefg")
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])

  end
end
