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
  
  # create an open struct and return this stuff so our controller
  # doesn't look like a monkey coded it
  def network_of_support(profile)
    question = profile.snapshot_1.questions.first
    
    network_of_support = {}
    network_of_support[:total] = 0
    response = question.response_from(self).code.split(',').collect{|r| r.strip.to_i}
    %w(family school cbo peers others reasons).each_with_index do |category, i|
      network_of_support[category.to_sym] = response[i]
      network_of_support[:total] += response[i].to_i
    end
    
    return OpenStruct.new(network_of_support)
  end
  
  def asset_analysis(profile)
    questions = profile.snapshot_3.questions
    
    asset_analysis = []
    questions.each do |question|
      response = question.response_from(self)
      asset_analysis << OpenStruct.new({question:question.question, response:response.response.to_i, color:question.question_category.color})
    end
    
    return asset_analysis
  end
  
  def asset_cluster_analysis(profile)
    questions = profile.snapshot_3.questions
    
    asset_cluster_analysis = []
    QuestionCategory.all.each do |question_category|
      asset_cluster_analysis << OpenStruct.new({:category => question_category.name, :value => question_category.responses_from(self).collect{|r| r.response.to_i}.inject(:+)/(question_category.responses_from(self).size*1.0),  :color => question_category.color})
    end
    
    return asset_cluster_analysis
  end
  
  def reflective_decision_making(profile)
    questions = profile.snapshot_2.questions + profile.snapshot_4.questions
    
    tallies = [0, 0, 0, 0]
    sum = 0
    questions.each do |question|
      level = question.response_from(self).code.strip.to_i
      tallies[level] += 1
      sum += 1
    end
      
    reflective_decision_making = []
    colors = ['#303b13', '#993333', '#ffff9a', '#b3c98b']
    %w(None/No\ Fit Common\ Sense Supports\ Action Supports\ Reflective\ Reasoned\ Action).each_with_index do |name, i|
      reflective_decision_making << OpenStruct.new({:name => name, :color => colors[i], :level => tallies[i], :value => (tallies[i]/(sum*1.0))*100})
    end

    return reflective_decision_making
  end
  
  private
  def assign_profiles
    self.assignments.create!(:profile_id => Profile::SPP)
    self.assignments.create!(:profile_id => Profile::CPP)
  end
end