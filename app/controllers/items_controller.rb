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
        redirect_to user_path(current_user)
      else
        render :new
      end
    end
   
   def show
   
   end
   
   private 
   
  def item_params
    params.require(:item).permit(:item_name,:purchase_date, :price, :home_id, :room_id)
  end
 
end