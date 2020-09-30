class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :login, :handle_login]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user] = @user.id
        if @user.user_type == "Owner"
          redirect_to teams_path
        else
          redirect_to rankings_path
        end
    else
      flash[:message] = "Passwords don't match"
      redirect_to new_user_path
    end
  end

  def destroy
    # @current_user.destroy ---> once we setup in applicationcontroller
    User.find(params[:id]).destroy
  end

  def login
  end

  def handle_login
    @user = User.find_by(username: params[:username])
    
    if @user && @user.authenticate(params[:password])
      session[:user] = @user.id
      if @user.user_type == "Owner"
          redirect_to teams_path
      else
        redirect_to rankings_path
      end
    else
      flash[:message] = "Incorrect username or password"
      redirect_to login_path
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :user_type)
  end

end
