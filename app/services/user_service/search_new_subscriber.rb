# frozen_string_literal: true

module UserService
  class SearchNewSubscriber
    def initialize(point_id, user, badge_id = nil)
      @point_id = point_id
      @user = user
      @badge_id = badge_id
    end

    def call
      new_user = User.fin
    end

    
  end
end
