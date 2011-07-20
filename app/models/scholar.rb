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
    
    def aggregate_report(profile, scholars)
      num_scholars = scholars.size.to_f # to_f to guarantee floating points later
      networks_of_support, asset_analyses, asset_cluster_analyses, reflective_decision_makings = [], [], [], []
      scholars.each do |scholar|
        networks_of_support << scholar.network_of_support(profile)
        asset_analyses << scholar.asset_analysis(profile)
        asset_cluster_analyses << scholar.asset_cluster_analysis(profile)
        reflective_decision_makings << scholar.reflective_decision_making(profile)
      end

      agg_network_of_support = Hash.new(0)
      networks_of_support.each do |network_of_support|
        agg_network_of_support[:total] += network_of_support.total
        agg_network_of_support[:family] += network_of_support.family
        agg_network_of_support[:school] += network_of_support.school
        agg_network_of_support[:cbo] += network_of_support.cbo
        agg_network_of_support[:peers] += network_of_support.peers
        agg_network_of_support[:others] += network_of_support.others
        agg_network_of_support[:reasons] += network_of_support.reasons
      end
      agg_network_of_support.each_pair {|k,v| agg_network_of_support[k] = (v/num_scholars).round(1)}
      agg_network_of_support = OpenStruct.new(agg_network_of_support)

      agg_asset_analysis = asset_analyses.shift # [] - remove the first asset_analysis so we can be somewhat efficient
      asset_analyses.each do |asset_analysis|
        asset_analysis.each_with_index do |question, i|
          agg_asset_analysis[i].response += question.response
        end
      end
      agg_asset_analysis.each {|aaa| aaa.response = (aaa.response/num_scholars).round(1)}
      
      agg_asset_cluster_analysis = asset_cluster_analyses.shift
      asset_cluster_analyses.each do |asset_cluster_analysis|
        asset_cluster_analysis.each_with_index do |response, i|
          agg_asset_cluster_analysis[i].value += response.value
        end
      end
      agg_asset_cluster_analysis.each {|aaca| aaca.value = (aaca.value/num_scholars).round(1)}
      
      agg_reflective_decision_making = reflective_decision_makings.shift
      reflective_decision_makings.each do |reflective_decision_making|
        reflective_decision_making.each_with_index do |response, i|
          agg_reflective_decision_making[i].level += response.level
          agg_reflective_decision_making[i].tallies += response.tallies
          agg_reflective_decision_making[i].value += response.value
        end
      end
      agg_reflective_decision_making.each {|ardm| ardm.level = (ardm.level/num_scholars).round(1); ardm.value = (ardm.value/num_scholars).round(1); ardm.tallies = (ardm.tallies/num_scholars).round(1)}
      
      return agg_network_of_support, agg_asset_analysis, agg_asset_cluster_analysis, agg_reflective_decision_making
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
      network_of_support[:total] += response[i].to_i unless category == 'reasons'
    end
    
    return OpenStruct.new(network_of_support)
  end
  
  def asset_analysis(profile)
    questions = profile.snapshot_3.questions
    
    asset_analysis = []
    questions.each do |question|
      response = question.response_from(self)
      asset_analysis << OpenStruct.new({question:"#{question.question_number}. #{question.question}", response:response.response.to_i, color:question.question_category.color})
    end
    
    return asset_analysis
  end
  
  def asset_cluster_analysis(profile)
    questions = profile.snapshot_3.questions
    
    asset_cluster_analysis = []
    QuestionCategory.all.each do |question_category|
      responses = question_category.responses_from(self)
      num_responses = responses.size.to_f
      asset_cluster_analysis << OpenStruct.new({:category => question_category.name, :value => responses.collect{|r| r.response.to_i}.inject(:+)/num_responses,  :color => question_category.color})
    end
    
    return asset_cluster_analysis
  end
  
  def reflective_decision_making(profile)
    # snapshots 2 & 4, but ignore 2 questions of snapshot 4
    questions = profile.snapshot_2.questions + profile.snapshot_4.questions[1..2] + profile.snapshot_4.questions[4..5]
    
    tallies = [0, 0, 0, 0]
    sum = 0.to_f
    questions.each do |question|
      level = question.response_from(self).code.strip.to_i
      tallies[level] += 1
      sum += 1
    end
      
    reflective_decision_making = []
    colors = ['#303b13', '#993333', '#ffff9a', '#b3c98b']
    %w(None/No\ Fit Common\ Sense Supports\ Action Supports\ Reflective\ Reasoned\ Action).each_with_index do |name, i|
      reflective_decision_making << OpenStruct.new({:name => name, :color => colors[i], :level => i, :tallies => tallies[i], :value => ((tallies[i]/sum)*100).round(1)})
    end

    return reflective_decision_making
  end
  
  private
  def assign_profiles
    self.assignments.create!(:profile_id => Profile::SPP)
    self.assignments.create!(:profile_id => Profile::CPP)
  end
end