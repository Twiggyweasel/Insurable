class ItemsController < ApplicationController
   
   
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      #do something
      flash[:success] = "Your item was created successfully!"
      redirect_to room_path(@item.room_id)
    else
      render :new
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
      params.require(:item).permit(:item_name,:purchase_date, :price, :home_id, :room_id)
    end
 
end