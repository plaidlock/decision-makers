class ProfilesController < ApplicationController
  def show
    # find the current profile and get the assignment for the current_user
    @profile = Profile.find(params[:id])
    @assignment = @profile.assignments.find_by_scholar_id!(current_user.id)

    # redirect back if they've already completed this assignment
    if @assignment.is_completed?
      flash[:alert] = "You have already completed the #{@profile.name}. You can only complete each profile once!"
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
        unless response.blank?
          r = current_user.responses.find_or_initialize_by_question_id(question_id:question_id)
          r.response = response
          r.save!
        end
      end
    end

    # mark the assignment as being completed iff they didn't save later
    unless params[:partial_submit].present?
      flash[:notice] = "You have completed the #{@profile.name}. Please proceed to the next step."
      @assignment.completed = Time.now
      @assignment.save!
    else
      flash[:notice] = "You have started your #{@profile.name}. You can return to this page to finish it at a later time."
    end

    redirect_to step_path
  end
end