class CreateSnapshots < ActiveRecord::Migration
  def self.up
    create_table :snapshots do |t|
      t.integer :profile_id
      t.string :name
      t.string :subtitle
      t.text :text
    end
    
    add_index :snapshots, :profile_id
  end

  def self.down
    drop_table :snapshots
  end
end
