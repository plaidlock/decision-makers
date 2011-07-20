class Assignment < ActiveRecord::Base
  # callbacks
  before_create :create_assigned_datetime
  
  # relationships
  belongs_to :scholar
  belongs_to :profile
  
  # validations
  validates :scholar_id, :profile_id, :presence => true, :allow_nil => false
    
  # class methods
  class << self
    def coded
      where('assignments.is_coded = ?', true)
    end
    
    def uncoded
      where('assignments.is_coded = ?', false)
    end
    
    def recently_completed(profile)
      where(['assignments.profile_id = ? AND assignments.completed IS NOT NULL', profile]).order('assignments.completed DESC')
    end
    
    def completed
      where('assignments.completed IS NOT NULL')
    end
  end
  
  # instance methods
  def is_started?
    !self.started.nil?
  end
  
  def is_completed?
    !self.completed.nil?    
  end
  
  def status
    self.is_completed? ? '&#x2713' : (self.is_started? ? '~' : 'assigned')
  end
  
  private
  def create_assigned_datetime
    self.assigned = Time.new
  end
end