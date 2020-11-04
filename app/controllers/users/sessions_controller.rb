class Users::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.


  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
