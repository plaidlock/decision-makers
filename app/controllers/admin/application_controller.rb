class Admin::ApplicationController < ApplicationController
  before_filter :require_admin
  layout :process_layout
  
  private
  def require_admin
    redirect_to root_path, :alert => 'You must be an administrator to access that resource!' unless logged_in? && current_user.is_a?(Administrator)
  end

  def process_layout
    request.xhr? ? nil : 'administrator'
  end
end