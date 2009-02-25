class Activity < ActiveRecord::Base
  named_scope :by_user, lambda { |users|
     { :conditions => { :user_id => users}}
  }

  named_scope :by_action, lambda { |action|
     { :conditions => { :action => action.to_s }}
  }

  named_scope :by_item, lambda { |item|
     { :conditions => { :item_type => item.class.name, :item_id => item.id }}
  }
  
  named_scope :created_since, lambda { |time_ago| 
    { :conditions => ['created_at > ?', time_ago]}
  }
    

  belongs_to :user
  belongs_to :item, :polymorphic => true
  validates_presence_of :user_id

  def self.created_by(user)
    raise "Activity.created_by(user) has been deprecated. Use Activity.by_user(user) instead."
  end

  def self.without_model_created_by(user)
    raise "Activity.without_model_created_by(user) has been deprecated. Use Activity.by_user(user) and filter the results instead."
  end

  def without_model?
    item.nil?
  end
  
  def self.report(user, action, object=nil)
    returning Activity.new do |a|
      a.item = object if object
      a.action = action.to_s
      a.user = user
      a.save!
    end
  end

end