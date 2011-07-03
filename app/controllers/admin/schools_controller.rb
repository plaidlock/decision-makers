class Admin::SchoolsController < Admin::ApplicationController
  def index
    @schools = School.all
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(params[:school])
    
    if @school.save
      redirect_to admin_schools_path, :notice => 'School was added!'
    else
      flash.now[:alert] = @school.errors.full_messages.join('<br />').html_safe
      render :action => 'new'
    end
  end
  
  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    
    if @school.update_attributes(params[:school])
      redirect_to admin_schools_path, :notice => 'School was updated!'
    else
      flash.now[:alert] = @school.errors.full_messages.join('<br />').html_safe
      render :action => 'edit'
    end
  end
  
  def destroy
    @school = School.find(params[:id])
    
    if @school.update_attributes(:is_active => false)
      redirect_to admin_schools_path, :notice => 'School was removed!'
    else
      flash.now[:alert] = @school.errors.full_messages.join('<br />').html_safe
      render :action => 'show'
    end
  end
end