module ApplicationHelper
  def remember_me_checkbox(form)
    form.input :remember_me, as: :boolean if devise_mapping.rememberable?
  end

  def minimum_chars_hint(minimum_password_length)
    "#{minimum_password_length} characters minimum" if minimum_password_length
  end

end
