module ActivitiesHelper
  def activity_image_src(activity)
    if activity.group.present?
      url_for(activity.group.icon) if activity.group.icon.attached?
    else
      "https://bulma.io/images/placeholders/128x128.png"
    end
  end

end
