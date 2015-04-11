class ProfilesController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :auth_permissions

  def index
    @profiles = User.looking_for_team.includes(:profile)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  #profiles/:id/leave_group
  def leave_group
    group = @cur_user.group
    if @cur_user == group.admin
      members = group.users
      if members.count <= 1
        @cur_user.group = nil
        @cur_user.save
        group.destroy!
      else
        members.delete @cur_user
        group.admin = members[0]
        group.save!
      end
    else
      @cur_user.group = nil
      @cur_user.save!
    end

    redirect_to group
  end
end
