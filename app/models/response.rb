class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :scholar, :foreign_key => 'scholar_id', :class_name => 'Scholar'
  
  # validations
  validates :scholar_id, :question_id, :response, :presence => true, :allow_nil => false
  validates :question_id, :uniqueness => { :scope => :scholar_id }
  
  # instance methods
  def is_coded?
    !self.code.nil?
  end
end