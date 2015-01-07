class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.text :self_sum
      t.text :life_sum
      t.text :skills
      t.text :favorites
      t.text :needs
      t.text :thoughts
      t.text :fun_acts
      t.text :msg_reason

      t.timestamps
    end
  end
end
