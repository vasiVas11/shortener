class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ini_search

  def ini_search
    @q = Shorter.search(params[:q])
  end

end
