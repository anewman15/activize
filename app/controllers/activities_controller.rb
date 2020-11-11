class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      redirect_to user_activities_path, notice: 'New activity created successfully!'
    else
      render 'new'
    end
  end

  def index
    @activity = Activity.new
    activities
    @activities_duration_total = current_user.activities_duration_total
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :amount, :group_id)
  end

  def activities
    @activities = current_user.activities.latest_first
  end
end
