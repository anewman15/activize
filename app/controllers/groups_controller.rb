class GroupsController < ApplicationController
# before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:name, :icon])
  end

  def index
    @group = Group.new
    @groups = Group.all
  end
end
