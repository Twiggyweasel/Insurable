class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.date :purchase_date
      t.integer :price, :user_id, :room_id, :home_id
      t.timestamps
    end
  end
end
