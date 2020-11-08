class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def show

  end

  def index
    @activity = Activity.new
    ungrouped_activities
    @groups = current_user.groups
  end

  private

  def ungrouped_activities
    @ungrouped_activities = current_user.ungrouped_activities.latest_first
  end

end
