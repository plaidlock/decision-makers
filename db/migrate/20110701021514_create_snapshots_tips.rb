class CreateSnapshotsTips < ActiveRecord::Migration
  def self.up
    create_table :snapshots_tips, :id => false do |t|
      t.integer :snapshot_id
      t.integer :tip_id
    end

    add_index :snapshots_tips, :snapshot_id
    add_index :snapshots_tips, :tip_id
  end

  def self.down
    drop_table :snapshots_tips
  end
end