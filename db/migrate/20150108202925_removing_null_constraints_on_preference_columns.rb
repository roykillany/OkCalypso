class RemovingNullConstraintsOnPreferenceColumns < ActiveRecord::Migration
  def change
    change_column :preferences, :target_people, :string, null: true
    change_column :preferences, :target_age_range, :string, null: true
    change_column :preferences, :target_location, :string, null: true
    change_column :preferences, :target_purpose, :string, null: true
  end
end
