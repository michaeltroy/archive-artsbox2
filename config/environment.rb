# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Artsbox::Application.initialize!

#Artsbox::Initializer.run do |config|
#  
##  config.gem 'will_paginate', :version => '~> 2.3.15', :source => 'http://gemcutter.org'  
## config.gem "adzap-ar_mailer", :lib => 'action_mailer/ar_mailer', :source => 'http://gems.github.com'
#  config.gem "paperclip", :version => '>=2.3', :source => 'http://gems.github.com'  
#  
#  # mail settings.
#  config.action_mailer.smtp_settings = {
#    :address          => "mail.metaset.com.au",
#    :port             => 25,
#    :domain           => "metaset.com.au",
#    :authentication   => :login,
#    :user_name        => "test@metaset.com.au",
#    :password         => "testtest"
#  }
#  
#  # Observers.
#  config.active_record.observers = :account_observer, :user_observer, :comment_observer, :post_observer
#  
#end
