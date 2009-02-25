require 'rubygems'
gem 'activerecord'
require 'active_record'
require 'factory_girl'
require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'acts_as_scribe'
require 'activity'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
load(File.dirname(__FILE__) + "/schema.rb")
load(File.dirname(__FILE__) + "/models.rb")



Spec::Runner.configure do |config|
  
end