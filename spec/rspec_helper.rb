require 'rspec'

# Load all files in the 'lib' directory
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use the documentation formatter
  config.formatter = :documentation

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option
  Kernel.srand config.seed
end