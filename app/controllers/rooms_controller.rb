class RoomsController < ApplicationController

  def new
    @room = Room.new 
  end
  
  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      flash[:success] = "Your item was created successfully!"
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])  
  end
  
  
  private 
    def room_params
      params.require(:room).permit(:room_name,:user_id, :home_id)
    end
    
  
end
