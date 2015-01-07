class AddIndexToUserIdPreferences < ActiveRecord::Migration
  def change
  end
  add_index :preferences, :user_id, unique: true
end
