class User < ApplicationRecord
  enum role: %w(default admin)

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
      user.attributes = {
       provider: auth[:provider],
       uid: auth[:uid],
       email: auth[:info][:email],
       first_name: auth[:info][:first_name],
       last_name: auth[:info][:last_name],
       token: auth[:credentials][:token],
       refresh_token: auth[:credentials][:refresh_token],
       oauth_expires_at: auth[:credentials][:expires_at]
     }
     user.save!
     user
  end
end
