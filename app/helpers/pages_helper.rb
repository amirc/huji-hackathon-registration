module PagesHelper
  def show_logo
    action_name == 'new' and controller_name == 'registrations'
  end
end
