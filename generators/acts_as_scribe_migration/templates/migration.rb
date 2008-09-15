class ActsAsScribeMigration < ActiveRecord::Migration

  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.string  :action
      t.integer :item_id
      t.string  :item_type
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end

end