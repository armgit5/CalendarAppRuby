module ApplicationHelper
  
  def sortable(title, column)
#  css_class = column == params[:sort] ? "current_#{params[:direction]}" : nil
  direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
  link_to(title, :sort => column, :action => 'index', :direction => direction)
#    :class => css_class)
  end
  
end
