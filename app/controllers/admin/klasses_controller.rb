class Admin::KlassesController < Admin::ApplicationController
  def index
    @klasses = Klass.all
  end
  
  def show
    @klass = Klass.find(params[:id])
    @scholars = @klass.scholars.page(params[:page] || 0).per(10)
  end
  
  def new
    @klass = Klass.new
  end
  
  def create
    @klass = Klass.new(params[:klass])
    
    if @klass.save
      redirect_to admin_klasses_path, :notice => 'Class was added!'
    else
      flash.now[:alert] = @klass.errors.full_messages.join('<br />').html_safe
      render :action => 'new'
    end
  end
  
  def edit
    @klass = Klass.find(params[:id])
  end
  
  def update
    @klass = Klass.find(params[:id])
    
    if @klass.update_attributes(params[:klass])
      redirect_to admin_klasses_path, :notice => 'Class was updated!'
    else
      flash.now[:alert] = @klass.errors.full_messages.join('<br />').html_safe
      render :action => 'edit'
    end
  end
  
  def destroy
    @klass = Klass.find(params[:id])
    
    if @klass.update_attributes(:is_active => false)
      redirect_to admin_klasses_path, :notice => 'Class was removed!'
    else
      flash.now[:alert] = @klass.errors.full_messages.join('<br />').html_safe
      render :action => 'show'
    end
  end
end