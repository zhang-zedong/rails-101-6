module GroupsHelper
  def render_group_description(group)
    simple_form_for(group.description)
  end
end
