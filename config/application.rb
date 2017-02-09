require_relative 'boot'

require 'rails/all'
require 'csv'
require 'carrierwave'

Bundler.require(*Rails.groups)

module Hrc
  class Application < Rails::Application
  config.autoload_paths << Rails.root.join("lib")
  end
end
