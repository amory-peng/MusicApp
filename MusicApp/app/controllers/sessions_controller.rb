class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_credential(
      session_params[:email], session_params[:password]
    )
    if user
      login(user)
      redirect_to user_url(user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
