ENV['RAILS_ENV'] ||= 'test'

require "spec_helper"
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"
require "pry"
require "support/factories"
require "support/helpers"
require "support/database_cleaner"

File.expand_path('../../config/environment', __FILE__)

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

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
