ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner-active_record"  # Certifique-se de que está correto

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # DatabaseCleaner setup
  DatabaseCleaner.strategy = :transaction

  # Ensure DatabaseCleaner is clean before running tests
  setup do
    DatabaseCleaner.clean_with(:truncation)  # Limpa o banco antes dos testes
    DatabaseCleaner.start                     # Inicia o DatabaseCleaner
  end

  teardown do
    DatabaseCleaner.clean                     # Limpa o banco após os testes
  end

  # Add more helper methods to be used by all tests here...
end