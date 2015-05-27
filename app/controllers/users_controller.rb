class UsersController < ApplicationController
    
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      #do something
      flash[:success] = "Your account has been created successfully!"
      #session[:chef_id] = chef.id
      redirect_to home_path
    else
      render 'new'
    end
  end
  
  private 
    def user_params
      params.require(:user).permit(:email, :password)
    end
end