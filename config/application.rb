require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Itt
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/services)
    config.autoload_paths += %W(#{config.root}/app/validators)
  end
end
