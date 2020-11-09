module ActivitiesHelper
  def activity_image_src(activity)
    if activity.group.present?
      url_for(activity.group.icon) if activity.group.icon.attached?
    else
      'https://bulma.io/images/placeholders/128x128.png'
    end
  end

  def duration_hours(duration)
    duration.to_i / 60
  end

  def duration_mins(duration)
    duration.to_i % 60
  end

  def create_activity_button(current_user)
    content_tag :nav, class: 'navbar is-fixed-bottom' do
      content_tag :div, class: 'columns is-centered' do
        content_tag :div, class: 'column' do
          content_tag :div, class: 'box has-text-centered has-background-success' do
            link_to 'Create a New Activity', new_user_activity_path(current_user),
                    class: 'button is-fullwidth is-success is-inverted is-outlined'
          end
        end
      end
    end
  end
end
