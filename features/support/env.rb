require 'rubygems'
gem 'activerecord'
require 'active_record'
require 'factory_girl'
require 'redgreen'
require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'acts_as_scribe'
require 'activity'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
load(File.dirname(__FILE__) + "/../../spec/schema.rb")
load(File.dirname(__FILE__) + "/../../spec/models.rb")


require 'test/unit/assertions'

World do |world|
  
  world.extend(Test::Unit::Assertions)
  
  world
end
