module ApplicationHelper
  def errors(model)
    render :partial => "shared/errors", :locals => { :model => model }
  end
end