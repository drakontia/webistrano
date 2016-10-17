class UsersController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :ensure_admin, :only => [:new, :destroy, :create, :enable]
  before_filter :ensure_admin_or_my_entry, :only => [:edit, :update]

  # GET /users
  def index
    @users = User.order('login ASC')
    respond_with(@users)
  end

  # GET /users/new
  def new
    @user = User.new
    respond_with(@user)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account created"
      respond_with(@user, :location => @user)
    else
      respond_with(@user)
    end
  end

  # GET /users/1
  def show
    @user = User.find_by(id: params[:id])
    @deployments = @user.deployments.recent
    respond_with(@user)
  end

  # GET /users/edit/1
  def edit
    @user = User.find_by(id: params[:id])
    respond_with(@user)
  end

  # PUT /users/1
  def update
    @user = User.find_by(id: params[:id])

    unless current_user.admin?
      params[:user].delete(:admin)
    end

    if @user.update_attributes(user_params)
      flash[:notice] = 'User was successfully updated.'
      respond_with(@user, :location => @user)
    else
      respond_with(@user)
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to users_path, :notice => 'User was successfully deleted.'
  end

  # POST /users/1
  def enable
    @user = User.find_by(id: params[:id])

    if @user.admin? && User.admins.count == 1
      flash[:notice] = 'Can not disable last admin user.'
    else
      if @user.disabled?
        @user.enable!
        flash[:notice] = "User was enabled"
      else
        @user.disable!
        flash[:notice] = 'User was disabled.'
      end
    end

    respond_with(@user)
  end

  # GET /users/1/deployments
  def deployments
    @user = User.find_by(id: params[:id])
    @deployments = @user.deployments

    respond_with(@deployments)
  end

private

  def ensure_admin_or_my_entry
    if current_user.admin? || current_user.id == User.find(params[:id]).id
      return true
    else
      redirect_to root_url
      return false
    end
  end

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation, :remember_me, :time_zone, :tz, :admin)
  end

end
