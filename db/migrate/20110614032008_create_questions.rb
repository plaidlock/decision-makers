class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :snapshot_id
      t.integer :question_category_id, :default => nil
      t.text :question
      t.string :category, :default => nil
      t.integer :display_order, :default => nil
      t.boolean :is_codeable, :default => false
    end

    add_index :questions, :snapshot_id
    add_index :questions, :category
    add_index :questions, :question_category_id
    add_index :questions, :display_order
  end

  def self.down
    drop_table :questions
  end
end
