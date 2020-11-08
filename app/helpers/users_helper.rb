module UsersHelper
  def current_user_name
    current_user.name.upcase if user_signed_in?
  end

  def logout_button
    return unless user_signed_in?
    
    link_to  "Logout", destroy_user_session_path, method: :delete, class: "button is-primary"
  end

  def login_button
    return if user_signed_in?

    link_to  "Log In", new_user_session_path, class:"button is-primary"
  end

  def sign_up_button
    return if user_signed_in?

    link_to "Sign Up", new_user_registration_path, class: "button is-primary"
  end
end
