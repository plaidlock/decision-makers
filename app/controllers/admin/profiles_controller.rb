class Admin::ProfilesController < Admin::ApplicationController
  def index
    @profile = Profile.find(params[:id])
    @assignments = Assignment.where(:profile_id => @profile.id).includes(:scholar).page(params[:page])
    
    unless params[:klass_id].blank?
      @klass = Klass.find(params[:klass_id])
      @assignments = @assignments.where(:scholar_id => @klass.scholars)
    end
    unless params[:school_id].blank?
      @school = School.find(params[:school_id])
      @assignments = @assignments.where(:scholar_id => @school.scholars)
    end
    
    @assignments.sort!{|a,b| a.scholar.last_name <=> b.scholar.last_name}
  end

  def show
    @scholar = Scholar.find(params[:scholar_id])
    @profile = Profile.find(params[:id])
    @assignment = @scholar.assignments.find_by_profile_id!(params[:id])
  end
  
  def code
    @scholar = Scholar.find(params[:scholar_id])
    @profile = Profile.find(params[:profile_id])
    @assignment = @scholar.assignments.find_by_profile_id!(params[:profile_id])
    
    begin
      Response.transaction do
        params[:responses].each_pair do |response_id, value|
          value = value.collect{|k,v| v}.join(',') if value.is_a?(Hash)

          r = @scholar.responses.find(response_id)
          r.code = value
          r.save!
        end
      end
    rescue Exception => e
      flash.now[:alert] = 'There were errors in coding the response.'
      if Rails.env.development?
        flash.now[:alert] += '<br />'.html_safe
        flash.now[:alert] += e.to_s
      end
      return render :action => 'show'
    end
    
    @assignment.is_coded = true
    @assignment.save!
    
    redirect_to admin_scholar_profile_path(@scholar, @profile), :notice => 'Profile was coded!'
  end
end