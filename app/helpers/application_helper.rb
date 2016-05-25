module ApplicationHelper
  def logout_header
    return "<a class='btn btn-danger-outline nav-item' href='/logout'>Logout</a>".html_safe if current_user
  end
end
