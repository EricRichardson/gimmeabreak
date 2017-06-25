class StepsLog < ApplicationRecord

  def user
    user_device = UserDevice.find_by(device_id: self.device_id)
    User.find user_device.user_id
  end

end
