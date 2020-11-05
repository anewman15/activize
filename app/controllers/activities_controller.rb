class ActivitiesController < ApplicationController

  def index
    @activity = Activity.new
    @activities = current_user.activities
    @groups = Group.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build()
  end
end
