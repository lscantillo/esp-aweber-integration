require 'rails_helper'
RSpec.describe AweberWorker, type: :worker do
  sidekiq_file = File.join(Rails.root, "config", "schedule.yml")
  schedule = YAML.load_file(sidekiq_file)[:schedule]

  describe "Validate job classes" do
    schedule.each do |k, v|
      klass = v["class"]
      it "#{k} has #{klass} class in /workers" do
        expect { klass.constantize }.not_to raise_error
      end
    end
  end

  describe "Validate job names" do
    schedule.each do |k, v|
      klass = v["class"]
      it "#{k} has correct name" do
        expect(k).to eq(klass.underscore)
      end
    end
  end

end
