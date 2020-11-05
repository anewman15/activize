class ActivitiesController < ApplicationController
before_action :authenticate_user!
  def index
    @activity = Activity.new
    @activities = current_user.activities
    @groups = Group.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    @activity.save
  end

  def show

  end

  def activity_params
    params.require(:activity).permit(:name, :amount, :group.id)
  end
end
