class Scholar < User
  GRADES = {:'9' => 'Freshman', :'10' => 'Sophomore', :'11' => 'Junior', :'12' => 'Senior'}
  
  after_save :assign_profiles
  
  belongs_to :klass
  has_many :assignments
  has_many :responses
  belongs_to :school
  
  validates :school_id, :klass_id, :birthdate, :grade, :presence => true, :allow_nil => false

  class << self
    def search(q, limit = 10)
      self.where(['users.first_name LIKE ? OR users.last_name LIKE ?', "%#{q}%", "%#{q}%"]).limit(limit)
    end
  end
    
  def name
    [first_name, last_name].join(' ')
  end
  
  def age
    ((Time.new - self.birthdate.to_time) / 1.year).floor
  end
  
  private
  def assign_profiles
    self.assignments.create!(:profile_id => Profile::SPP)
    self.assignments.create!(:profile_id => Profile::CPP)
  end
end