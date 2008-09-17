module LinkingPaths
  module Acts #:nodoc:
    module Scribe #:nodoc:

      def self.included(base) # :nodoc:
        base.extend ClassMethods
      end

      module ClassMethods
        activity_options ||= {}

        def record_activity_of(actor, options = {})
          include_scribe_instance_methods {
            has_many :activities, :as => :item, :dependent => :destroy
            after_create do |record|
              unless options[:if].kind_of?(Proc) and not options[:if].call(record)
                record.create_activity_from_self 
              end
            end
          }
          self.activity_options.merge! :actor => actor
        end

        def record_activities(actions = [])
          include_scribe_instance_methods {
            has_many :activities
            has_many :activities_without_model, :class_name => "Activity", :conditions => { :item_type => nil, :item_id => nil }
          }
          self.activity_options.merge! :actions => actions
        end
        
        def include_scribe_instance_methods(&block)
          unless included_modules.include? InstanceMethods
            yield if block_given?
            class_inheritable_accessor :activity_options
            self.activity_options ||= {}
            include InstanceMethods
          end
        end
        
      end

      module InstanceMethods

        def create_activity_from_self
          activity = Activity.new
          activity.item = self
          activity.action = ActiveSupport::Inflector::underscore(self.class)
          actor_id = self.send( activity_options[:actor].to_s + "_id" )
          activity.user_id = actor_id
          activity.save
        end

        def record_activity(action)
          if activity_options[:actions] && activity_options[:actions].include?(action)
            activity = Activity.new
            activity.action = action.to_s
            activity.user_id = self.id
            activity.save!
          else
            raise "The action #{action} can't be tracked."
          end
        end    


      end

    end
  end
end