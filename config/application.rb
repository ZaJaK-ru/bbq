require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module Bbq
  class Application < Rails::Application
    #config.load_defaults 6.1
    config.i18n.default_locale = :ru
    config.i18n.locale = :ru
    config.generators.system_tests = nil
  end
end
