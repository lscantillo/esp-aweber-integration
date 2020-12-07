# frozen_string_literal: true

module UserService
  class SearchNewSubscriber
    def initialize
    end

    def call
      @new_users = User.by_receive_mail(true).by_info_status_empty
      @new_users.find_each do |user|
        AweberService::AddSubscriber.new(user).call
      end
      UserService::ChangeUserInfo.new.call
    end
  end
end
