class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :home_name
      t.integer :user_id
      t.datetime
    end
  end
end
