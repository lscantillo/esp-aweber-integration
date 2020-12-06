module AweberService
  class GetAccessToken
    def initialize(point_id, user, badge_id = nil)
      @point_id = point_id
      @user = user
      @badge_id = badge_id
    end

    def call
      badges_scope.find_each do |badge|
        @user.history_badges.create(badge: badge)
      end
    end

    
  end
end