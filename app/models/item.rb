class Item < ActiveRecord::Base
    belongs_to :room
    belongs_to :user
    belongs_to :home
    
    validates :item_name, presence: true, length: {minimum: 3, maximum: 10 }
    validate :purchase_date_cannot_be_in_the_future
    validates :price, presence: true, :numericality => {:greater_than => 0.1, :less_than => 100000}
    mount_uploader :item_picture, PictureUploader
    


  def purchase_date_cannot_be_in_the_future
    errors.add(:purchase_date, "can't be on a future date") if
      !purchase_date.blank? and purchase_date > Date.today
  end

end