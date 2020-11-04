class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
end
