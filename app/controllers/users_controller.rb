class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.all
  end

  def create
    @user = user.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = user.new(user_params)
    if @user.save
      redirect_to @user, notice:"User was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to user_path(@user.list), notice:"User was successfully deleted"
  end

  private

  def user_params
  params.require(:user).permit(:first_name, :last_name)
  end
end
