class AddHomeItems < ActiveRecord::Migration
  def change
    add_column :items, :home_id, :integer
  end
end
