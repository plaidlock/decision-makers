class AddQuestionNumberToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :question_number, :string
  end

  def self.down
    remove_column :questions, :question_number
  end
end
