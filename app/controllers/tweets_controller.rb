class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    Tweet.create(message: params[:tweet][:message], user_id: session[:login_uid])
    redirect_to "/"
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
  end
end
