class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to issues_url
    else
      redirect_to login_url, alert: "Invalid email/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to issues_url, notice: "Logged Out"
  end
end
