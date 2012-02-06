class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :school_id
      t.integer :klass_id
      t.string :username
      t.string :password
      t.string :type
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :grade
      t.boolean :is_active, :default => true

      t.timestamps
    end

    add_index :users, :school_id
    add_index :users, :klass_id
    add_index :users, :username
    add_index :users, :type
  end

  def self.down
    drop_table :users
  end
end
