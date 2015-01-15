require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OkStupid
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.paperclip_defaults = {
      :storage => :s3,
      # :s3_protocol => 'http',
      # :url =>':s3_domain_url',
      :path => ":class/:id.:style.:extension",
      # :s3_host_name => 'YOUR_HOST_HERE',
      :s3_credentials => {
        :bucket => ENV['s3_bucket'], #these values safely stored in application.yml thanks to figaro!
        :access_key_id => ENV['s3_access_key_id'],
        :secret_access_key => ENV['s3_secret_access_key']
      }
    }
  end
end
