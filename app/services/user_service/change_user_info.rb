# frozen_string_literal: true

module UserService
  class ChangeUserInfo
    def initialize
    end

    def call
      @new_users = User.by_receive_mail(true).by_info_status_empty
      @new_users.find_each do |user|
        user.send_information_status = 'opted-in'
        user.save
      end
    end
  end
end
