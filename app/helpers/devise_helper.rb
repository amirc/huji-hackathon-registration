module DeviseHelper
  def devise_error_messages!
    resource.errors.full_messages.join('<br\>').html_safe #.map { |msg| content_tag(:li, msg) }.join
  end
end
