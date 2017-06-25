class UserDevice < ApplicationRecord
  belongs_to :user

  validates :device_id, uniqueness: true
end
