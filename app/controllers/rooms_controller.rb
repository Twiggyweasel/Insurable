class RoomsController < ApplicationController
  respond_to :js
  
  def new
    @room = Room.new 
  end
  
  def create
    @room = Room.new(room_params)
    @room.user = current_user
      if @room.save
      #flash[:success] = "Task was successfully created." if @room.save
      #respond_with(@room)  
        flash[:success] = "Your item was created successfully!"
        redirect_to room_path(@room)
      else
      render :new  
        #format.js {render file: '/rooms/new.js.erb' } 
        
      end
    #end  
  end

  def show
    @room = Room.find(params[:id])  
  end
  
  def edit
    @room = Room.find(params[:id]) 
  end
 
  def update
     respond_to do |format|
      if @room.update(room_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @room.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end
  
  private 
    def room_params
      params.require(:room).permit(:room_name,:user_id, :home_id)
    end
    
  
end
