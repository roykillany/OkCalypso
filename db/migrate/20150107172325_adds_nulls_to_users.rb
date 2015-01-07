class AddsNullsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :orientation, :string, null: false
    change_column :users, :gender, :string, null: false
    change_column :users, :country, :string, null: false
    change_column :users, :zip_code, :integer, null: false
  end
end
