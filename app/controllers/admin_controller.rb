class AdminController < ApplicationController
  before_filter :ensure_current_user_superuser
  before_filter :get_user, :except => [:index]
  
  def index
    @editors = User.find(:all, :conditions => { :editor => true})
    @superusers = User.find(:all, :conditions => {:superuser => true})
  end
  
  def demote_superuser
    if @user == current_user
      flash[:notice] = "You cannot demote yourself."
      redirect_to admin_path
      return false
    end
    flash[:notice] = "#{@user.full_name} is no longer a superuser. :("
    @user.superuser = false
    @user.save
    redirect_to admin_path
  end
  
  def demote_editor
    flash[:notice] = "#{@user.full_name} is no longer an editor."
    @user.editor = false
    @user.save
    redirect_to admin_path
  end
  
  def promote_editor
    flash[:notice] = "#{@user.full_name} is now an EDITOR!"
    @user.editor = true
    @user.save
    redirect_to admin_path
  end
  
  def promote_superuser
    flash[:notice] = "#{@user.full_name} is now a SUPERUSER!"
    @user.superuser = true
    @user.editor = false
    @user.save
    redirect_to admin_path
  end

  def get_user
    @user = User.find(params[:id])
  end

end
