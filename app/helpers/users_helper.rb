module UsersHelper
  def current_user_name
    current_user.name.upcase if user_signed_in?
  end

  def logout_button
    return unless user_signed_in?

    link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-primary'
  end

  def login_button
    return if user_signed_in?

    link_to 'Log In', new_user_session_path, class: 'button is-primary'
  end

  def sign_up_button
    return if user_signed_in?

    link_to 'Sign Up', new_user_registration_path, class: 'button is-primary'
  end

  def devise_errors_count(resource)
    resource.errors.count if resource.errors.any?
  end

  def devise_resource_class(resource)
    resource.class.model_name.human.downcase if resource.errors.any?
  end

  def devise_error_messages(resource)
    resource.errors.full_messages.each(&:to_s)
  end

  def devise_remember_me_checkbox(form)
    form.input :remember_me, as: :boolean if devise_mapping.rememberable?
  end

  def devise_minimum_chars_hint(minimum_password_length)
    "#{minimum_password_length} characters minimum" if minimum_password_length
  end

  def devise_login_link
    link_to 'Log in', new_user_session_path unless controller_name == 'sessions'
  end

  def devise_sign_up_link
    link_to 'Sign up', new_registration_path(resource_name) if devise_mapping.registerable? && controller_name != 'registrations'
  end

  def devise_forgot_password_link
    return unless devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'

    link_to 'Forgot your password?', new_password_path(resource_name)
  end

  def devise_no_confirmation_instructions_received_link
    return unless devise_mapping.confirmable? && controller_name != 'confirmations'

    link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name)
  end

  def devise_no_unlock_instructions_received_link
    return unless devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'

    link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name)
  end

  def devise_omniauth_sign_in_link
    return unless devise_mapping.omniauthable?

    resource_class.omniauth_providers.each do |provider|
      link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider)
    end
  end
end
