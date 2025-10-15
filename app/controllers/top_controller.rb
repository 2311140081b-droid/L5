class TopController < ApplicationController
  def login
    params_uid = params[:uid]
    params_pass = params[:pass]
    judge = Top.find_by(uid: params_uid)
    if judge != nil && BCrypt::Password.new(judge.pass) == params_pass then
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      render "error", status: 422
    end
  end

  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
  def signin_submit
    params_uid = params[:uid]
    params_pass = params[:pass]
    hash_pass = BCrypt::Password.create(params_pass)
    top = Top.new(uid: params_uid, pass: hash_pass)
    top.save
    redirect_to root_path
  end
  def signin
  end
end
