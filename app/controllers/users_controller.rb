class UsersController < ApplicationController
    
  before_action :set_user, only: [:edit, :update, :show]
    
  def new
    @user = User.new
    @user.homes.new
    
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      #do something
      session[:user_id] = @user.id
      #@home = Home.create do |u|
        #u.home_name = "New Home"
        #u.user_id = @user.id
      #end
      
      flash[:success] = "Your account has been created successfully!"
      
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
  
  def show
    #@homes = User.homes(params[:id])  
  end
  
  def index
  end
  
  
  private 
    def user_params
      params.require(:user).permit(:name,:email, :password, homes_attributes: [:home_name])
    end
    
    def set_user 
       @user = User.find(params[:id])
      
    end
      
end