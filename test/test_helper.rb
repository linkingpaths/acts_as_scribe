require 'test/unit'
require 'rubygems'

gem 'activerecord'
require 'active_record'

begin require 'redgreen'; rescue LoadError; end

begin
  require 'shoulda'
  require 'shoulda/active_record'
rescue LoadError => load_error
  $stderr.puts
  $stderr.puts "You need shoulda to run acts_as_scribe's tests. `gem install thoughtbot-shoulda` and try again."
  $stderr.puts
  exit
end

require 'factory_girl'
require File.expand_path(File.dirname(__FILE__) + '/factories')

require File.dirname(__FILE__) + "/../init"


ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
load(File.dirname(__FILE__) + "/schema.rb")

class Jaiku < ActiveRecord::Base
  belongs_to :user
  record_activity_of :user
end

class User < ActiveRecord::Base
  has_many :jaikus
  record_activities [:featured_on_home, :logged_in, :logged_out]
end



