class UsersController < ApplicationController

  def show
    if current_user.nil?
      redirect_to new_user_url
    else
      render user_url if current_user.id == params[:id]
    end
  end



  def new
    #auto renders new.html
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      redirect_to new_user_url
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
