class AddHomeIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :home_id, :integer
  end
end
