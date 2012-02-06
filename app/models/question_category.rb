class QuestionCategory < ActiveRecord::Base
  has_many :questions

  validates :name, :presence => true

  def responses_from(scholar)
    scholar.responses.where(:question_id => self.questions.collect{|q| q.id})
  end
end