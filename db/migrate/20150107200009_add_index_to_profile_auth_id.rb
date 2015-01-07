class AddIndexToProfileAuthId < ActiveRecord::Migration
  def change
  end
  add_index :profiles, :user_id, unique: true
end
