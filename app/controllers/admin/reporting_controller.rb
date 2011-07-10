class Admin::ReportingController < Admin::ApplicationController  
  require 'csv'
  
  # method for getting json of all scholars who have completed a profile in a class
  def scholars
    klass_scholar_ids = Klass.find(params[:klass_id]).scholars.collect{|s| s.id}    
    scholar_ids = Assignment.coded.where(:profile_id => params[:profile_id]).collect{|a| a.scholar_id}
    @scholars = Scholar.select('users.id, users.first_name, users.last_name').where(:id => (scholar_ids & klass_scholar_ids))

    render :json => @scholars
  end
  
  def aggregate
    return redirect_to admin_reporting_path, :alert => 'You did not complete all fields!' unless params[:profile_id] && params[:scholar_ids]
    @profile = Profile.find(params[:profile_id])
    @scholars = Scholar.where(:id => params[:scholar_ids])
    
    @network_of_support, @asset_analysis, @asset_cluster_analysis, @reflective_decision_making = Scholar.aggregate_report(@profile, @scholars)    
  end

  def scholar
    @scholar = Scholar.find(params[:scholar_id])
    @profile = Profile.find(params[:profile_id])
    @assignment = Assignment.find_by_scholar_id_and_profile_id(@scholar.id, @profile.id)
    return redirect_to admin_reporting_path, :alert => "#{@scholar.name}'s #{@profile.name} has not been coded!" unless @assignment.is_coded?
    
    @network_of_support = @scholar.network_of_support(@profile)
    @asset_analysis = @scholar.asset_analysis(@profile)
    @asset_cluster_analysis = @scholar.asset_cluster_analysis(@profile)
    @reflective_decision_making = @scholar.reflective_decision_making(@profile)    
  end
end