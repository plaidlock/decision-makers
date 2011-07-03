class ApplicationController < ActionController::Base
  protect_from_forgery
  include CustomAuth

  before_filter :require_login
end
