# app/jobs/demo_job.rb
# frozen_string_literal: true
class AweberJob < ApplicationJob
  def perform
    puts '***** I run every minute *****'
    # UserService::SearchNewSubscriber.new().call
    
  end
end