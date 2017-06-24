class User < ApplicationRecord
  has_many :devices
  validates :email, uniqueness: true
end
