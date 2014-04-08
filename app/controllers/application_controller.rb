class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ini_search

  def ini_search
    @q = Shorter.search(params[:q])
  end

  def after_sign_in_path_for(resource_or_scope)

    if session[:urls_shorted]
      Shorter.where(:id => session[:urls_shorted]).update_all(:user_id =>current_user.id)
    end
    super
  end

end
