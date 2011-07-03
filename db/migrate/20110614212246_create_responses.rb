class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :scholar_id
      t.integer :question_id
      t.text :response, :default => nil
      t.string :code, :default => nil
    end
  end

  def self.down
    drop_table :responses
  end
end
