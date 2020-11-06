class GroupsController < ApplicationController
  before_action :authenticate_user!

  def create
    # byebug
    @group = Group.new(group_params)
    @group.save

    if @group.save
      redirect_to groups_path, notice: "New group created successfully!"
    else
      rredirect_to groups_path, alert: "Something's wrong. Group not created :("
    end
  end

  def index
    @group = Group.new
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @group_activities = @group.activities.latest_first
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
