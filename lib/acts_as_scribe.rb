require 'scribe'
require 'activity'

ActiveRecord::Base.send :include, LinkingPaths::Acts::Scribe