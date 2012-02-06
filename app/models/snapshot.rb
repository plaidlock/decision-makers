class Snapshot < ActiveRecord::Base
  belongs_to :profile
  has_many :questions
  has_and_belongs_to_many :tips

  # validations
  validates :profile_id, :name, :presence => true, :allow_nil => false

  # default scope
  default_scope order('snapshots.display_order')

  # instance methods
  def grouped_questions
    hash = {}

    if questions.first.category.nil?
      self.questions.each_with_index{ |q, i| hash[i] = [q] }
    else
      self.questions.each{ |q| (hash[q.category] ||= []) << q }
    end

    hash
  end
end