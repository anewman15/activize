module ApplicationHelper
  def remember_me_checkbox(form)
    form.input :remember_me, as: :boolean if devise_mapping.rememberable?
  end

end
