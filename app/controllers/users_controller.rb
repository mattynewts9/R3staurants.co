class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def shared
    @user = current_user
  end

  def new
    @user = User.new # Initialize a new User object
  end

  def create
    @user = User.new(user_params) # Corrected the model reference from 'user' to 'User'
    if @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit  # Added edit action to render the edit form
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])  # Find the user by ID
    if @user.update(user_params)  # Use update instead of new
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])  # Find the user by ID before trying to destroy it
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."  # Redirect to index after deletion
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
