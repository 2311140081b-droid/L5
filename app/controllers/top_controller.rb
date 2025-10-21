class TopController < ApplicationController
  def login
    params_uid = params[:uid]
    params_pass = params[:pass]
    if User.find_by(uid: params_uid) &&User.find_by(pass: params_pass) then
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    end
  end

  def main
    if session[:login_uid] != nil
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
