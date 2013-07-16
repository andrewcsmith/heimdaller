module ApplicationHelper
  def set_active_tab this_tab
    if this_tab == params[:controller]
      return 'class="active"'
    else
      return ''
    end
  end
end
