class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    user = User.new(uid: params[:user][:uid], pass: params[:user][:pass], age: params[:user][:age])
    user.save
    redirect_to '/'
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/'
  end
end
