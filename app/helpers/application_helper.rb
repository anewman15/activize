module ApplicationHelper
  def all_activities_link
    link_to 'All Activities', user_activities_path(current_user) if user_signed_in?
  end

  def ungrouped_activities_link
    link_to 'Ungrouped Activities', users_path(current_user) if user_signed_in?
  end

  def activity_groups_link
    link_to 'Activity Groups', user_groups_path(current_user) if user_signed_in?
  end

  def home_page_links(current_user)
    link1 = link_to 'All Activities', user_activities_path(current_user), class: 'custom-link'
    link2 = link_to 'Ungrouped Activities', users_path, class: 'custom-link'
    link3 = link_to 'Activity Groups', user_groups_path(current_user), class: 'custom-link'

    [[link1, 'fa-tasks'], [link2, 'fa-ban'], [link3, 'fa-object-group']]
  end

  def link_to_home_page
    if user_signed_in?
      content_tag :div, class: 'navbar-item' do
        link_to 'Activize', current_user,
                class: 'is-size-3 has-text-white has-text-weight-bold'
      end
    else
      content_tag :div, class: 'navbar-item' do
        link_to 'Activize', root_path,
                class: 'is-size-3 has-text-white has-text-weight-bold'
      end
    end
  end

  def flash_notice(notice)
    return unless flash[:notice]

    content_tag :div, class: 'notification is-success global-notification' do
      content_tag :p, class: 'notice' do
        notice
      end
    end
  end

  def flash_alert(alert)
    return unless flash[:alert]

    content_tag :div, class: 'notification is-warning global-notification' do
      content_tag :p, class: 'alert' do
        alert
      end
    end
  end
end
