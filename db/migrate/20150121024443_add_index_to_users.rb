class AddIndexToUsers < ActiveRecord::Migration
  def change
  end
  add_index :users, [:provider, :uid], unique: true
end
