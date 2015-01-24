class AddIndexToUserColumnOnIsGuest < ActiveRecord::Migration
  def change
  end
  add_index :users, :is_guest
end
