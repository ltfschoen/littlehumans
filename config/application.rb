require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module LittlehumansApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Sydney'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # test to try and get mixins loaded when deploy to heroku
    config.assets.initialize_on_precompile = false

    # show rails asset pipeline where vendor assets are located 
    # http://makandracards.com/makandra/8951-rails-asset-pipeline-how-to-organize-stylesheets-in-sub-folders
    config.assets.paths += Dir["#{Rails.root}/vendor/assets/*"].sort_by { |dir| -dir.size }

    # autoload custom directories with modules and classes
    # http://stackoverflow.com/questions/3356742/best-way-to-load-module-class-from-lib-folder-in-rails-3
    config.autoload_paths += Dir["#{config.root}/lib", "#{config.root}/lib/**/"]
  end
end
