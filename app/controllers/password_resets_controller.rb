class PasswordResetsController < ApplicationController
    
  def new
  end

  def create
  user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:success] = "Email sent with reset instuctions"
    redirect_to root_url 
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
      if @user.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, flash[:warning] = "Password reset has expired!" 
      elsif @user.update_attributes(params[:user].permit(:password))
        redirect_to root_url 
      else
        render :edit
      end
  end
    
  
   private 
    def user_params
      params.require(:user).permit(:name,:email, :password, homes_attributes: [:home_name])
    end  
end