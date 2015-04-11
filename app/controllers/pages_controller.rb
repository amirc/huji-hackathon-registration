class PagesController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :auth_permissions, except: [:waiting]

  def waiting
    redirect_to :edit_user_registration unless @cur_user.is_waiting
  end

  def home
    redirect_to :edit_user_registration
  end

  def rules

  end
end
