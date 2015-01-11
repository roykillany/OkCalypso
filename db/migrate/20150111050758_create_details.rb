class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :user_id, null: false
      t.string :orientation
      t.string :ethnicity
      t.integer :height
      t.string :body_type
      t.string :diet
      t.string :smokes
      t.string :drinks
      t.string :drugs
      t.string :religion
      t.string :sign
      t.string :education
      t.string :job
      t.string :income
      t.string :relationship_status
      t.string :relationship_type
      t.string :offspring
      t.string :pets
      t.text :languages

      t.timestamps
    end
    add_index :details, :user_id, unique: true
  end
end
