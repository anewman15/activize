class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def show

  end

  def index
    @activity = Activity.new
    @ungrouped_activities = current_user.ungrouped_activities
    @groups = Group.all
  end

end
