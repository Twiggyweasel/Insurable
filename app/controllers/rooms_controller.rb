class RoomsController < ApplicationController

  def new
    @room = Room.new 
  end
  
  def create
    @room = Room.new(rooms_params)
    @room.user = current_user
    if @room.save
      flash[:success] = "Your item was created successfully!"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
  
  def rooms_params
    params.require(:room).permit(:room_name, :home_id)
  end

end
