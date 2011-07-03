class Admin::HomeController < Admin::ApplicationController
  def index
    @recent_spp = Assignment.recently_completed(Profile::SPP)
    @recent_cpp = Assignment.recently_completed(Profile::CPP)
  end
end