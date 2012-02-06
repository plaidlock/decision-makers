class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :scholar_id
      t.integer :profile_id
      t.boolean :is_coded, :default => false
      t.datetime :assigned, :default => nil
      t.datetime :started, :default => nil
      t.datetime :completed, :default => nil
    end

    add_index :assignments, :scholar_id
    add_index :assignments, :profile_id
  end

  def self.down
    drop_table :assignments
  end
end
