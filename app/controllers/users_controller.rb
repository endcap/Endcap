class UsersController < ApplicationController
  before_filter :ensure_not_logged_in, :only => [:new, :create]
  
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
  
  def new
    @user = User.new
  end
  

  def edit
    if !current_user
      redirect_to root_url
      return false
    end
    @user = current_user
  end
  
  
  def create    
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Welcome!'
      redirect_to root_url
    else
      render :action => "new"
    end
  end
  
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Profile updated!'
      redirect_to root_url
    else
      render :action => "edit"
    end
  end
  
  
  private
  
  def ensure_not_logged_in
    if current_user
      redirect_to root_url
      return false
    end
  end
  
end
