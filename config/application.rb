require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsProject
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false 
    config.time_zone = 'America/Argentina/Buenos_Aires' 
    WeekOfMonth.configuration.monday_active = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
