class ProfilesController < ApplicationController
  def show
    # find the current profile and get the assignment for the current_user
    @profile = Profile.find(params[:id])
    @assignment = @profile.assignments.find_by_scholar_id!(current_user.id)
    
    # redirect back if they've already completed this assignment
    if @assignment.is_completed?
      flash[:error] = "You have already completed the #{@profile.name}. You can only complete each assignment one time!"
      redirect_to step_path
    end
    
    # mark the assignment as having started
    @assignment.started = Time.now
    @assignment.save!
  end
  
  def submit
    # find the profile and assignment again
    @profile = Profile.find(params[:id])
    @assignment = @profile.assignments.find_by_scholar_id!(current_user.id)
    
    # wrap the questions in a transaction
    Response.transaction do
      # params[:questions] is a question_id => value hash
      params[:questions].each_pair do |question_id, response|
        current_user.responses.create!(question_id:question_id, response:response)
      end
    end
    
    # mark the assignment as being completed
    @assignment.completed = Time.now
    @assignment.save!
    
    # give some informative information
    flash[:notice] = "You have completed the #{@profile.name}. Please proceed to the next step."
    redirect_to step_path
  end
end