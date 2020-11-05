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
    @activity = current_user.activities.build()
  end

  def show

  end
end
