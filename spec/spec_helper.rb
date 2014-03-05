ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = true

  config.order = "random"
end
