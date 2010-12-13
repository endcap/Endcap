class UsersController < ApplicationController
  before_filter :ensure_not_logged_in, :only => [:new, :create]
  before_filter :ensure_logged_in_and_get_user, :only => [:edit, :update]
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
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
  end
  
  def search_by_name
    names = params[:name].split(' ')
    names << '' if names.length == 1
    @users = User.find(:all, :conditions => ["first_name like ? and last_name like ?", "%"+names[0]+"%", "%"+names[1]+"%"], :limit => 5)
    @users.each do |user|
      user.crypted_password = ''
      user.password_salt = ''
      user.persistence_token = ''
    end
    respond_to do |format|
      format.json { render :json => @users }
    end
  end
  
  def create
    if (params[:user][:image])
      params[:user][:image] = User.save(params[:user])
      logger.info "set params[:user][:image] to #{params[:user][:image]}"
    end
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Welcome!'
      redirect_to root_url
    else
      render :action => "new"
    end
  end
  
  
  def update
    if (params[:user][:image])
      params[:user][:image] = User.save(params[:user])
      logger.info "set params[:user][:image] to #{params[:user][:image]}"
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Profile updated!'
      redirect_to show_artist_path(current_user)
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
  
  def ensure_logged_in_and_get_user
    if !current_user
      redirect_to root_url
      return false
    end
    @user = current_user
  end
  
end
