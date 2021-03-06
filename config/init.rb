# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '5d3ceac2e6cf9a933ebbf49d009dffb79df09382'  # required for cookie session store
  c[:session_id_key] = '_maskeet_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
  Merb::Plugins.config[:dm_pagination] = {
    :prev_label => "<img src='/images/previous.gif' />",
    :next_label => "<img src='/images/next.gif' />",
    :truncate => "..."
  }
  Merb::Mailer.config = {
    :host => 'smtp.gmail.com',
    :port => '587',
    :user => 'user@gmail.com',
    :pass => 'pass',
    :auth => :plain
  }
end
