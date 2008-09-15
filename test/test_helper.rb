require 'test/unit'

require 'rubygems'
gem 'activerecord'
require 'active_record'
begin require 'redgreen'; rescue LoadError; end

require File.dirname(__FILE__) + "/../init"

plugin_root = File.join(File.dirname(__FILE__), '..')

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")

def setup_db
  ActiveRecord::Schema.define(:version => 1) do
    create_table :jaikus do |t|
      t.string :content
      t.integer :user_id
      t.timestamps
    end
    create_table :activities do |t|
      t.integer :user_id
      t.string  :action
      t.integer :item_id
      t.string  :item_type
      t.timestamps
    end
    create_table :users do |t|
      t.string  :login
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end


class Jaiku < ActiveRecord::Base
  belongs_to :user
  acts_as_scribe :user
end

class User < ActiveRecord::Base
  has_many :jaikus
  tracks_unlinked_activities [:featured_on_home]
end



