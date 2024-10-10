class ReviewsController < ApplicationController

  def create
    @review = review.new(review_params)
    @review.user = current_user
    if review.save
      redirect_to @restaurants, notice: "Review was successfully created"
    else
      render :restaurants, :show
    end
  end


  def edit
    @review = user.new(user_params)
    if @user.save
      redirect_to @user, notice: "User was successfully updated"
    else
      render :edit
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @restaurants, notice: "Review was successfully updated"
    end

  end

  def destroy
    @user.destroy
    redirect_to user_path(@user.list), notice: "User was successfully deleted"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
