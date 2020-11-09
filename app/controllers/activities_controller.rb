class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      redirect_to user_activities_path, notice: "New activity created successfully!"
    else
      redirect_to user_activities_path, alert: "Something's wrong. Activity not created :("
    end

  end

  def index
    @activity = Activity.new
    activities
    @activities_duration_total = current_user.activities_duration_total
    @groups = current_user.groups
  end

  def show

  end

  private

  def activity_params
    # byebug
    params.require(:activity).permit(:name, :amount, :group_id)
  end

  def activities
    @activities = current_user.activities.latest_first
  end
end
