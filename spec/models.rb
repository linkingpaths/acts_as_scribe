class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  record_activity_of :author, :if => Proc.new { |post| post.private == false }
end


class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  record_activity_of :user
end

class Group < ActiveRecord::Base
  has_many :users, :through => :memberships
end

class User < ActiveRecord::Base
  has_many :groups, :through => :memberships
end

