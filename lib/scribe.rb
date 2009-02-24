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
                user = record.send(activity_options[:actor])
                Activity.report(user, :create, record)
              end
            end
            after_destroy do |record|
              unless options[:if].kind_of?(Proc) and not options[:if].call(record)
                user = record.send(activity_options[:actor])
                Activity.report(user, :destroy, record)
              end
            end
          }
          self.activity_options.merge! :actor => actor
        end

        def record_activities(actions = [])
          raise "record_activities(#{actions.join ','}) has been deprecated. Use Activity.report(user, #{actions.first}), etc. instead."
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
        def record_activity(action)
            raise "record_activity has been deprecated. Use Activity.report(actor, action, item)."
        end
      end

    end
  end
end