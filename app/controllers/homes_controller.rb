class HomesController < ApplicationController

  def index
    @home = Home.find(current_user)
  end
    
    
end
