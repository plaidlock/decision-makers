class Admin::ScholarsController < Admin::ApplicationController 
  def index
    respond_to do |format|
      format.html {
        page = (params[:page] || 0).to_i
        @scholars = Scholar.page(params[:page] || 0).per(25)        
      }
      format.json {
        @scholars = Scholar.select('users.id, users.first_name, users.last_name').where(:klass_id => params[:class_id])
        render :json => @scholars
      }
    end
  end
  
  def search
    @scholars = Scholar.search(params[:term])
    render :json => @scholars
  end
  
  def show
    @scholar = Scholar.find(params[:id])
    @spp = @scholar.assignments.find_by_profile_id(Profile::SPP)
    @cpp = @scholar.assignments.find_by_profile_id(Profile::CPP)
  end
  
  def new
    @scholar = Scholar.new
  end
  
  def create
    params[:scholar][:birthdate] = Chronic::parse(params[:scholar][:birthdate]) unless params[:scholar][:birthdate].blank?
    @scholar = Scholar.new(params[:scholar])
    
    if @scholar.save
      redirect_to admin_scholars_path, :notice => 'Scholar was added!'
    else
      flash.now[:alert] = @scholar.errors.full_messages.join('<br />').html_safe
      render :action => 'new'
    end
  end
  
  def edit
    @scholar = Scholar.find(params[:id])
  end
  
  def update
    @scholar = Scholar.find(params[:id])
    params[:scholar][:birthdate] = Chronic::parse(params[:scholar][:birthdate]) unless params[:scholar][:birthdate].blank?
    
    if @scholar.update_attributes(params[:scholar])
      redirect_to admin_scholars_path, :notice => 'Scholar was updated!'
    else
      flash.now[:alert] = @scholar.errors.full_messages.join('<br />').html_safe
      render :action => 'edit'
    end
  end
  
  def destroy
    @scholar = Scholar.find(params[:id])
    
    if @scholar.update_attributes(:is_active => false)
      redirect_to admin_scholars_path, :notice => 'Scholar was deactivated!'
    else
      flash.now[:alert] = @scholar.errors.full_messages.join('<br />').html_safe
      render :action => 'show'
    end
  end
end