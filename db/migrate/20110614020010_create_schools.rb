class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name
      t.boolean :is_active, :default => true
    end

    add_index :schools, :name
  end

  def self.down
    drop_table :schools
  end
end
