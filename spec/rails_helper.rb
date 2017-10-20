require "shoulda-matchers"
require 'factory_girl_rails'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    require "active_record" 
    with.library :active_record
    with.library :active_model
  end
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
