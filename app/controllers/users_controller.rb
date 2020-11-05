class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def show

  end

end
