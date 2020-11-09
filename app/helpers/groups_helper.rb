module GroupsHelper
  def group_img_url(group)
    url_for(group.icon) if group.icon.attached?
  end

  def create_group_button(current_user)
    content_tag :nav, class: "navbar is-fixed-bottom" do
      content_tag :div, class: "columns is-centered" do
        content_tag :div, class: "column" do
          content_tag :div, class: "box has-text-centered has-background-success" do
            link_to  "Create a New Group", new_user_group_path(current_user),
              class: "button is-fullwidth is-success is-inverted is-outlined"
          end
        end
      end
    end
  end
end
