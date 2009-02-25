#require 'activity'
require 'scribe'

ActiveRecord::Base.send :include, LinkingPaths::Acts::Scribe