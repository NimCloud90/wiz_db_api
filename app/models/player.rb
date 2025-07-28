class Player < ApplicationRecord
  has_many :character
  after_create :create_character

  validates :username, :password, presence: true
  has_secure_password
end
