class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to user_groups_path, notice: 'New group created successfully!'
    else
      render 'new'
    end
  end

  def index
    @group = Group.new
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    group_activities
    @activities_duration_total = @group.activities_duration_total
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def group_activities
    @group_activities = @group.activities.latest_first
  end
end
