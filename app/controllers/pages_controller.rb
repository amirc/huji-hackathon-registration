class PagesController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!

  def waiting
  end

  def home
    render :waiting if cur_user.is_waiting
  end
end
