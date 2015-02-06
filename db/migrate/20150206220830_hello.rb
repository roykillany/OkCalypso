class Hello < ActiveRecord::Migration
  def change
    remove_column :users, :longitude, :float
    remove_column :users, :latitude, :float
  end
end
