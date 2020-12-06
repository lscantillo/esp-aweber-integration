# frozen_string_literal: true

class AweberWorker
  include Sidekiq::Worker

  def perform
    UserService::SearchNewSubscriber.new.call
  end
end
