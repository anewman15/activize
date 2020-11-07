module ApplicationHelper

  def home_page_links(current_user)
    link1 = link_to  "All Activities", user_activities_path(current_user)
    link2 = link_to  "Ungrouped Activities", users_path
    link3 = link_to  "Activity Groups", user_groups_path(current_user)

    [ link1, link2, link3 ]
  end

  def link_to_home_page
    if user_signed_in?
      content_tag :div, class: "navbar-item" do
        link_to 'Activize', current_user,
          class: "is-size-3 has-text-white has-text-weight-bold"
      end
    else
      content_tag :div, class: "navbar-item" do
        link_to 'Activize', root_path,
          class: "is-size-3 has-text-white has-text-weight-bold"
      end
    end
  end

  def link_to_current_user_name
    return unless user_signed_in?

    link_to current_user.name, current_user,
      class: "has-text-white has-text-weight-bold"
  end

  def link_to_create_activity
    return unless user_signed_in?

    link_to  "Create an Activity", user_activities_path(current_user),
      class: "button is-danger is-info has-text-centered"
  end

  def remember_me_checkbox(form)
    form.input :remember_me, as: :boolean if devise_mapping.rememberable?
  end

  def minimum_chars_hint(minimum_password_length)
    "#{minimum_password_length} characters minimum" if minimum_password_length
  end

end
