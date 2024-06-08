class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.find_my_mentions
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to sign_in_path, alert: 'YOU SHALL NOT PASS!!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
