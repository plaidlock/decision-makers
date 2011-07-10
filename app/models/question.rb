class Question < ActiveRecord::Base
  NON_CODEABLE_OPTIONS = [['Select Fit...', 0], ['Not My Situation', 1], ['Sort of Fits', 2], ['Fits Pretty Well', 3], ['Strongly Fits', 4]]
  
  belongs_to :question_category
  belongs_to :snapshot
  has_many :responses
  has_many :scholars, :through => :responses
  
  default_scope order(:display_order).includes(:responses, :scholars)
  
  # validations
  validates :snapshot_id, :question, :presence => true, :allow_nil => false
  
  # instance methods
  def response_from(scholar)
    self.responses.where(:scholar_id => scholar.id).first
  end
end