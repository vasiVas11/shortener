class UserController < ApplicationController

  before_filter :authenticate_user!

  def my_links
    @shorters = current_user.shorters
  end

  def index
    @shorters = current_user.shorters.paginate(:page => params[:page], :per_page => 10)

  end
end
