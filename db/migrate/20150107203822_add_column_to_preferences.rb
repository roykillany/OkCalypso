class AddColumnToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :user_id, :integer, null: false
  end
end
