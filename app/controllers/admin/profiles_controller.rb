class Admin::ProfilesController < Admin::ApplicationController
  def index
    @profile = Profile.find(params[:id])
    @assignments = Assignment.uncoded.recently_completed(@profile.id).page(params[:page] || 0).per(25)
    if params[:klass_id]
      @klass = Klass.find(params[:klass_id])
      @assignments = @assignments.where(:scholar_id => @klass.scholars)
    end
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