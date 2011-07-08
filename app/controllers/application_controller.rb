class ApplicationController < ActionController::Base
  protect_from_forgery
  include CustomAuth
  layout :process_layout

  before_filter :require_login
  private
  def process_layout
    request.xhr? ? nil : 'application'
  end
end
