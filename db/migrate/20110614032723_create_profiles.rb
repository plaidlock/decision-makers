class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.text :text
    end
    
    add_index :profiles, :name
  end

  def self.down
    drop_table :profiles
  end
end
