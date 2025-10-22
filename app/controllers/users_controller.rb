class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
      u = User.create(uid: params[:user][:uid], 
          password: params[:user][:password],
          password_confirmation: params[:user][:password_confirmation])
    u.save
    redirect_to '/'
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/'
  end
end
