class ProfilesController < ApplicationController
  def show
    @profile =Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.message = params[:profile][:message]
    @profile.save
    redirect_to profile_path(@profile)
  end
  def create 
    u=User.create(uid: params[:user][:uid],pass:params[:user][:pass])
    Profile.create(message:"",user_id:u.id)
    redirect_to users_path
  end
  def destroy
    u=User.find(params[:id])
    u.destroy
    p=Profile.find_by(user_id:u.id)
    p.destroy
    redirect_to users_path
  end
end
