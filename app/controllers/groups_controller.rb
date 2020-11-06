class GroupsController < ApplicationController
  before_action :authenticate_user!

  def create
    # byebug
    @group = Group.new(group_params)
    @group.save
    redirect_to groups_path
  end

  def index
    @group = Group.new
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @group_activities = @group.activities
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
