# frozen_string_literal: true

class AweberWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    puts '***** I run every minute *****'
    UserService::SearchNewSubscriber.new().call
  end
end
