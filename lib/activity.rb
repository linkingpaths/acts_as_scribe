class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :polymorphic => true
  validates_presence_of :user_id

  def self.created_by(user)
    Activity.find(:all, :conditions => { :user_id => user.id})
  end

  def self.without_model_created_by(user)
    Activity.find(:all, :conditions => { :user_id => user.id, :item_type => nil, :item_id => nil})
  end

  def without_model?
    item.nil?
  end
end
