class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  enum role: %w(default admin)

end
