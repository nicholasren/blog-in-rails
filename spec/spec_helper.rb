ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rubygems'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'gizmo'
require 'database_cleaner'
require 'pry'


Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  include Gizmo::Helpers
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.include Capybara::DSL
end

Gizmo.configure do |config|
  config.mixin_dir = File.join(File.dirname(__FILE__), '../features/support/pages/')
end

Capybara.default_selector = :css
Capybara.javascript_driver = :selenium

module Capybara
  module DSL
    alias :response :page
  end
end


