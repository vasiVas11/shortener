class UserController < ApplicationController

  before_filter :authenticate_user!

  def my_links
    @shorters = current_user.shorters
  end

  def index
    @shorters = current_user.shorters

  end
end
