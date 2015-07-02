class Room < ActiveRecord::Base
    belongs_to :user
    belongs_to :home
    has_many :items
    
    validates :room_name, presence: true 
   
    def item_total
      self.items.size
    end
    
    def item_value
        self.items(:price).sum(:price)
    end
end
