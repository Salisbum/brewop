ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require "capybara/rspec"
require "rspec/rails"
require "spec_helper"
require "capybara/rails"
require "capybara/poltergeist"
require "pry"
require "support/factories"
require "support/helpers"
require "support/database_cleaner"

Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }

abort("The Rails environment is running in production mode!") if Rails.env.production?

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryGirl::Syntax::Methods
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
