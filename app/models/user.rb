class User < ApplicationRecord
    validates :username, presence: true, exclusion: { in: %w(admin superuser) }, uniqueness: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :password, presence: true
end
