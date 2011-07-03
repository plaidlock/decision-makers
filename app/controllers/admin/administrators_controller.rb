class Admin::AdministratorsController < Admin::ApplicationController
  def index
    @administrators = Administrator.all
  end
  
  def show
    @administrator = Administrator.find(params[:id])
  end
  
  def new
    @administrator = Administrator.new
  end
  
  def create
    @administrator = Administrator.new(params[:administrator])
    
    if @administrator.save
      redirect_to admin_administrators_path, :notice => 'Administrator was created!'
    else
      flash.now[:alert] = @administrator.errors.full_messages.join('<br />').html_safe
      render :action => 'new'
    end
  end
  
  def edit
    @administrator = Administrator.find(params[:id])
  end
  
  def update
    @administrator = Administrator.find(params[:id])
    
    if @administrator.update_attributes(params[:administrator])
      redirect_to admin_administrators_path, :notice => 'Administrator was updated!'
    else
      flash.now[:alert] = @administrator.errors.full_messages.join('<br />').html_safe
      render :action => 'edit'
    end
  end
  
  def destroy
    @administrator = Administrator.find(params[:id])
    
    if @administrator.update_attributes(:is_active => false)
      redirect_to admin_administrators_path, :notice => 'Administrator was deleted!'
    else
      flash.now[:alert] = @administrator.errors.full_messages.join('<br />')
      render :action => 'show'
    end
  end
end