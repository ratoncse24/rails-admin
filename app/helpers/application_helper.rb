module ApplicationHelper

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end


  # view content status to list
  def status_tag(status)
    if status == 1
      content_tag( :span , "Active", :class => "label label-success")
    else
      content_tag( :span , "DeActive", :class => "label label-warning")
    end
  end

end
