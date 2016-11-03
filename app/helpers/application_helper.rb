module ApplicationHelper
  def is_controller(name)
    return "active" if controller_name == name
  end

  def is_page(page)
    return "active" if params[:id] == page
  end
end
