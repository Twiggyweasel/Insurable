class UsersController < ApplicationController
    
  before_action :set_user, only: [:edit, :update, :show]
    
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
  
  def show
    #@homes = User.homes(params[:id])  
  end
  
  
  private 
    def user_params
      params.require(:user).permit(:name,:email, :password)
    end
    
    def set_user 
       @user = User.find(params[:id])
      
    end
      
end