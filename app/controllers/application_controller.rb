class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :ensure_logged_in
  helper_method :ensure_current_user_editor_or_superuser
  helper_method :ensure_current_user_superuser
  
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def ensure_logged_in
    if current_user
      return true
    else
      redirect_to root_url
      return false
    end
  end
  
  def ensure_current_user_editor_or_superuser
    if current_user && (current_user.editor? || current_user.superuser?)
      return true
    else
      flash[:notice] = "You do not have access to do that."
      redirect_to root_url
      return false
    end
  end
  
  def ensure_current_user_superuser
    if current_user && current_user.superuser?
      return true
    else
      flash[:notice] = "You do not have access to do that."
      redirect_to root_url
      return false
    end
  end
end
