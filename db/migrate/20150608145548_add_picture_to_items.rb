class AddPictureToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_picture, :string
  end
end
