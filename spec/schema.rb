ActiveRecord::Schema.define(:version => 1) do
  create_table :activities do |t|
    t.integer :user_id
    t.string  :action
    t.integer :item_id
    t.string  :item_type
    t.timestamps
  end
  create_table :users do |t|
    t.string  :login
  end
  create_table :groups do |t|
    t.string  :name
  end
  create_table :memberships do |t|
    t.integer :user_id
    t.integer :group_id
  end
  create_table :posts do |t|
    t.integer :author_id
    t.boolean :private
    t.string  :title
  end
end