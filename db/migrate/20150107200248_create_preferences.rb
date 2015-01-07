class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :target_people, null: false
      t.string :target_age_range, null: false
      t.string :target_location, null: false
      t.string :target_purpose, null: false

      t.timestamps
    end
  end
end
