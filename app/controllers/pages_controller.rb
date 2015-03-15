class PagesController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!

  def home
  end
end
