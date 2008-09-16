ActiveRecord::Schema.define(:version => 1) do
  create_table :jaikus do |t|
    t.string :content
    t.integer :user_id
    t.timestamps
  end
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
end