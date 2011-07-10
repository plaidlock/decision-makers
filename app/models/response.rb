class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :scholar, :foreign_key => 'scholar_id', :class_name => 'Scholar'
  
  default_scope includes(:question, :scholar)
  
  # validations
  validates :scholar_id, :question_id, :response, :presence => true, :allow_nil => false
  validates :question_id, :uniqueness => { :scope => :scholar_id }
end