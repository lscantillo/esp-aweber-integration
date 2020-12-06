# frozen_string_literal: true

module UserService
  class SearchNewSubscriber
    def initialize
      
    end

    def call
      @new_users = User.by_receive_mail(true).by_info_status_empty.count
      UserService::ChangeUserInfo.new().call
    end

  end
end
