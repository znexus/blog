# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'warden', :version => '0.6.5'
  config.gem 'devise', :version => '0.7.0'
  config.gem 'rails-footnotes', :version => '3.6.3'
  config.gem "haml", :version => "= 2.2.15"
  config.gem 'mislav-will_paginate', :version => '~> 2.3.11', :lib => 'will_paginate', 
    :source => 'http://gems.github.com'
  config.gem 'formtastic'
  config.gem 'validation_reflection'
  config.time_zone = 'Lima'
  config.i18n.default_locale = 'es-PE'
  config.action_controller.resources_path_names = { :new => 'nuevo', :edit => 'editar' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        => 'localhost',
    :port           => 25,
    :domain         => 'cristiancastillo.com',
    #:authentication => :login,
    #:user_name      => 'www',
    #:password       => 'secret'
  }
end
