Factory.define :user do |user|
end
Factory.define :group do |group|
end
Factory.define :activity do |activity|
  activity.association :user
end
Factory.define :membership do |membership|
  membership.association :user
end
Factory.define :post do |post|
  post.private false
  post.association :author, :factory => :user
end
