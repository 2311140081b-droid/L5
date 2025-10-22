class TopController < ApplicationController
  def login
    user = User.find_by(uid: params[:uid])
    if user and user.authenticate(params[:pass])
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    end
  end

  def main
    if current_user
      redirect_to tweets_path
    else
      render "login"
    end
  end
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
