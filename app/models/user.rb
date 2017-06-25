class User < ApplicationRecord

  has_many :notifications


  def self.find_or_create_from_microsoft(microsoft_data)
    find_by_microsoft(microsoft_data) || create_from_microsoft(microsoft_data)
  end

  def self.find_by_microsoft(microsoft_data)
    find_by(uid: microsoft_data["uid"], provider: microsoft_data["provider"])
  end

  def self.create_from_microsoft(microsoft_data)
    full_name = microsoft_data["info"]["name"].split
    create!(first_name:       full_name[0],
           last_name:        full_name[1],
           uid:              microsoft_data["uid"],
           provider:         microsoft_data["provider"],
           microsoft_token:    microsoft_data["credentials"]["token"],
           microsoft_secret:   microsoft_data["credentials"]["secret"],
           password:         SecureRandom.hex(32),
           microsoft_raw_data: microsoft_data)
  end

  def from_microsoft?
    uid.present? && provider == "microsoft"
  end
  has_many :devices
  validates :email, uniqueness: true
end
