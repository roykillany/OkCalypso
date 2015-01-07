class AddVitalsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :orientation, :string
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :zip_code, :integer
  end
end
