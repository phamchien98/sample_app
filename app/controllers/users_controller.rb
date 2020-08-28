class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".success_mess"
      redirect_to @user
    else
      flash[:danger] = t ".fail_mess_create"
      render :new
    end
  end


  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".fail_mess_notfound"
    redirect_to root_path
  end

  private


  def user_params
    params.require(:user).permit User::USER_PARAMS
  end
end
