class GroupsController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :auth_permissions

  def index
    @groups = Group.for_public.includes(:profiles, :admin)
  end

  def show
    @group = Group.includes(:profiles, :admin).find(params[:id])
  end

  # groups/:id/add_user
  # { "email": "asd@asd.com"}
  def add_user
    @group = Group.includes(:profiles).find(params[:id])
    if @group.admin_id != cur_user.id
      render text: "You don't have permission to do that!"
      return
    elsif @group.profiles.count >= WebConfig::MAX_GROUP_MEMBERS
      flash['notice'] = 'There is no room in the group for more members'
      render :edit
      return
    end

    user = User.includes(:profile, :group).where(email: params[:email]).first
    if not user
      flash['notice'] = "Couldn't find user with email: #{params[:email]} #{user}"
      render :edit
      return
    elsif user.group
      flash['notice'] = "#{user.profile.full_name} is already in group '#{user.group.name}'"
      render :edit
      return
    elsif user.profile.is_waiting
      flash['notice'] = "#{user.profile.full_name} is on waiting list. Please contact us to see what can be done."
      render :edit
      return
    end

    @group.users << user
    flash['notice'] = "You added #{user.profile.full_name} successfully!"
    render :show
  end

  def edit
    @group = Group.where(admin_id: cur_user.id).find(params[:id])
  end

  def update
    @group = Group.where(admin_id: cur_user.id).find(params[:id])
    @group.update(group_params)
    @group.save!
    redirect_to @group
  end

  def new
    render text: "You can't open a new group since you already in one" if cur_user.group
    @group = Group.new
  end

  def create
    render text: "You can't open a new group since you already in one" if cur_user.group
    @group = Group.new(group_params)
    @group.admin = cur_user
    unless @group.save
      render :new
      return
    end
    cur_user.group = @group
    cur_user.save!
    redirect_to @group
  end

  private

  def group_params
    params.require(:group).permit(:is_looking_for, :looking_for, :idea, :name)
  end

end
