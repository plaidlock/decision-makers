class Admin::ReportingController < Admin::ApplicationController  
  require 'csv'
  
  def generate
    return redirect_to admin_reporting_path, :alert => 'You did not complete all fields!' unless params[:profile_id] && params[:scholar_ids]
    @profile = Profile.find(params[:profile_id])
    @scholars = Scholar.where(:id => params[:scholar_ids])
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