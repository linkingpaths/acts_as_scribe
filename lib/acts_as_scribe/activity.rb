class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :polymorphic => true
  validates_presence_of :user_id
  
  def self.by(user)
    Activity.count(:all, :conditions => ["user_id = ?", user.id])
  end

  def unlinked?
    item.nil?
  end
    
end
