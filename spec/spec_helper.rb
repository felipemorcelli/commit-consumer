gem 'rspec', :require => false, :group => :test
gem 'simplecov', :require => false, :group => :test
gem 'webmock', :require => false, :group => :test

require 'simplecov'
require 'spec_helper'
require 'webmock'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

SimpleCov.coverage_dir "#{Dir.pwd}/coverage"

SimpleCov.start do
  add_filter "#{Dir.pwd}/spec"

  add_group 'Libs', "#{Dir.pwd}/lib"
end
