module Users::RegistrationHelper

  def is_errors?
    not resource.errors.empty?
  end

  def error_messages_content!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
      <ul>#{messages}</ul>
    HTML

    html.html_safe
  end

  def error_messages_header!
    return '' if resource.errors.empty?
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
      #{sentence}
    HTML

    html.html_safe
  end
end