require 'acts_as_scribe/scribe'
require 'acts_as_scribe/activity'

ActiveRecord::Base.send :include, LinkingPaths::Acts::Scribe