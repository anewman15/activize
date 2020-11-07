class GroupsController < ApplicationController
  before_action :authenticate_user!

  def create
    # byebug
    @group = current_user.groups.build(group_params)
    @group.save

    if @group.save
      redirect_to user_groups_path, notice: "New group created successfully!"
    else
      rredirect_to user_groups_path, alert: "Something's wrong. Group not created :("
    end
  end

  def index
    @group = Group.new
    @groups = current_user.groups
  end

  def show
    # byebug
    @group = current_user.find_group(params)
    @group_activities = @group.activities.latest_first
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
