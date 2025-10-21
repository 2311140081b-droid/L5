class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    if User.find_by(uid: params[:user][:uid])==nil
      user = User.new(uid: params[:user][:uid], pass: params[:user][:pass])
      user.save
    end
    redirect_to '/'
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/'
  end
end
