ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # Windows can't fork/use UNIX sockets for parallel workers
  parallelize(workers: 1)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Parsed JSON body of the last request; re-parsed each call on purpose
class ActionDispatch::IntegrationTest
  def json
    JSON.parse(response.body)
  end
end
