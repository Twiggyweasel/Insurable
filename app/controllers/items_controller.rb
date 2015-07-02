class ItemsController < ApplicationController
   
   
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    respond_to do |format|
      if @item.save
        #do something
        format.json { head :no_content}
        format.js 
        flash[:success] = "Your item was created successfully!"
        #format.html {redirect_to homes_path }
        #redirect_to room_path(@item.room_id)
      else
        format.json { render json: @item.errors.full_messages, 
                            status: :unprocessable_entity }
      end
    
    end
  end
  
  def show
    
  end
   
  def edit
    @item = Item.find(params[:id])
  end
   
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      #do something
      flash[:success] = "Your item was updated successfully!"
      redirect_to room_path(@item.room_id)
    else
    
    render :edit
    
    end
  end
  
  def destroy
    @item = Item.find_by(params[:id])
    @item.destroy
  end
   
   private 
   
    def item_params
      params.require(:item).permit(:item_name,:purchase_date, :price, :home_id, :room_id, :item_picture)
    end
 
end