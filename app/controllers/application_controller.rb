class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #TODO: if project is getting big, fix this security issue.(for adding user to a group)
  protect_from_forgery with: :exception

  before_filter :set_user


  protected

  # hack for the IDE
  # @return [User]
  def cur_user
    current_user
  end

  def auth_permissions
    redirect_to :waiting if cur_user.is_waiting
  end

  private
  def set_user
    @cur_user = cur_user
  end

end
