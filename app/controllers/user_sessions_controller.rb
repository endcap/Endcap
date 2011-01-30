class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end
  
  
  def create
    @user_session = UserSession.new(params[:user_session])
    user = User.find_by_email(params[:user_session][:email])
    if user && !user.can_login
      flash[:notice] = "That user cannot login!"
      redirect_to root_url
    elsif @user_session.save
      flash[:notice] = "Hello!"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  

  def destroy
    @user_session = UserSession.find
    @user_session.destroy if @user_session
    flash[:notice] = "Goodbye!"
    redirect_to root_url
  end

end
