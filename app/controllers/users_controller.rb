class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to new_league_path
    else
      render :new
    end
  end

  def destroy
    # @current_user.destroy ---> once we setup in applicationcontroller
    User.find(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :user_type)
  end

end
